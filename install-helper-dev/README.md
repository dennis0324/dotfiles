# install-helper

`installables.yml`을 읽어 questionary로 설치 항목을 선택한 뒤 ansible-playbook을 실행합니다.

## 사용법

```bash
cd install-helper
uv run python main.py
```

**참고**: questionary는 인터랙티브 터미널(TTY)이 필요합니다. 일반 터미널에서 실행하세요.

## 구성

- `installables.yml`: 상위 디렉터리(ansible 루트)에 위치
- `main.py`: questionary 체크박스로 선택 → ansible-playbook -e @vars 실행

## 의존성

- questionary
- pyyaml

`uv sync`로 설치됩니다.
