#!/usr/bin/env python3
"""
install-helper: installables.yml을 읽어 questionary로 선택 후 ansible-playbook 실행
"""

import subprocess
import sys
import tempfile
from pathlib import Path

import questionary
import yaml


def load_installables(yml_path: Path) -> list[dict]:
    """installables.yml 로드 후 평탄화된 항목 리스트 반환"""
    with open(yml_path, encoding="utf-8") as f:
        data = yaml.safe_load(f)

    items = []
    for group in data.get("groups", []):
        group_name = group.get("name", "")
        for item in group.get("items", []):
            item_id = item.get("id", "")
            name = item.get("name", item_id)
            desc = item.get("description", "")
            label = f"{name}" + (f" - {desc}" if desc else "")
            items.append({"id": item_id, "name": name, "label": label})

    return items


def build_choices(items: list[dict]) -> list[questionary.Choice]:
    """questionary checkbox용 Choice 리스트 생성"""
    return [questionary.Choice(title=item["label"], value=item["id"]) for item in items]


def selected_to_vars(selected_ids: list[str], all_items: list[dict]) -> dict[str, bool]:
    """선택된 id 목록 → Ansible extra vars (install_xxx: true/false)"""
    all_ids = {item["id"] for item in all_items}
    selected_set = set(selected_ids)
    return {f"install_{id}": id in selected_set for id in all_ids}


def _base_dir() -> Path:
    """실행 파일/스크립트와 같은 디렉터리 (Nuitka 빌드 시 sys.executable 기준)"""
    if getattr(sys, "frozen", False):
        return Path(sys.executable).resolve().parent
    return Path(__file__).resolve().parent


def _find_yml(base: Path, name: str) -> Path | None:
    """상대경로로 yml 검색 (같은 디렉터리, cwd, 상위)"""
    for candidate in [base, Path.cwd(), base.parent]:
        path = candidate / name
        if path.exists():
            return path.resolve()
    return None


def main() -> int:
    base_dir = _base_dir()
    yml_path = _find_yml(base_dir, "installables.yml")
    playbook_path = _find_yml(base_dir, "playbook.yml")

    if yml_path is None:
        print("오류: installables.yml를 찾을 수 없습니다.", file=sys.stderr)
        return 1

    if playbook_path is None:
        print("오류: playbook.yml를 찾을 수 없습니다.", file=sys.stderr)
        return 1

    work_dir = playbook_path.parent

    items = load_installables(yml_path)
    if not items:
        print("설치 가능한 항목이 없습니다.", file=sys.stderr)
        return 1

    choices = build_choices(items)

    selected = questionary.checkbox(
        "설치할 항목을 선택하세요 (Space: 토글, Enter: 확정):",
        choices=choices,
        instruction="(↑↓ 이동)",
    ).ask()

    if selected is None:
        print("취소되었습니다.")
        return 0

    if not selected:
        print("선택된 항목이 없습니다.")
        return 0

    vars_dict = selected_to_vars(selected, items)

    # 임시 vars 파일 생성 (YAML)
    with tempfile.NamedTemporaryFile(
        mode="w", suffix=".yml", delete=False, encoding="utf-8"
    ) as f:
        yaml.dump(vars_dict, f, default_flow_style=False, allow_unicode=True)
        vars_path = f.name

    try:
        print("\n다음 항목을 설치합니다:", ", ".join(selected))
        run = questionary.confirm("ansible-playbook을 실행할까요?", default=True).ask()
        if not run:
            print("취소되었습니다.")
            return 0

        ansible_cmd = ["ansible-playbook", "playbook.yml", "-e", f"@{vars_path}"]
        result = subprocess.run(ansible_cmd, cwd=str(work_dir))
    finally:
        Path(vars_path).unlink(missing_ok=True)
    return result.returncode


if __name__ == "__main__":
    sys.exit(main())
