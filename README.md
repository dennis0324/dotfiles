# macOS 초기 설정 Ansible Playbook

이 Ansible playbook은 macOS 맥북 초기 설정을 자동화합니다.

## 현재 기능

- **Homebrew 설치**: Homebrew가 설치되어 있지 않으면 자동으로 설치
- **필수 앱 설치**: 다음 앱들을 Homebrew를 통해 자동 설치
  - iTerm2
  - Discord
  - AlDente
  - Notion
  - Notion Calendar
  - Scroll Reverser
  - Cursor
  - Microsoft Edge
  - Rectangle
- **개발 도구 설치**: 다음 개발 도구들을 자동 설치
  - zsh (Homebrew)
  - Git (Homebrew)
  - pyenv (Python 버전 관리, Homebrew)
  - uv (Python 패키지 설치/관리, Astral)
  - oh-my-zsh (Zsh 프레임워크)
  - powerlevel10k (Zsh 테마)
  - zsh-syntax-highlighting (Zsh 플러그인, Homebrew)
  - zsh-autosuggestions (Zsh 플러그인, Homebrew)
  - zsh-history-substring-search (Zsh 플러그인, Homebrew)
  - zoxide (스마트 디렉토리 점프 도구, Homebrew)

## 처음 시작하기: Ansible 설치

맥북을 처음 받았을 때, 이 playbook을 실행하기 전에 먼저 Ansible을 설치해야 합니다.

### 방법 1: pip3 사용 (권장 - Homebrew 없이도 가능)

macOS에는 기본적으로 Python 3가 설치되어 있으므로, pip3를 사용하여 Ansible을 설치할 수 있습니다:

```bash
# 터미널(Terminal.app)을 열고 다음 명령 실행
pip3 install ansible

# 설치 확인
ansible --version
```

**참고**: 
- `pip3`가 없다면 `python3 -m ensurepip --upgrade`를 먼저 실행
- 권한 문제가 발생하면 `pip3 install --user ansible` 사용
- 설치 후 PATH에 `~/.local/bin`을 추가해야 할 수 있습니다:
  ```bash
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
  ```

### 방법 2: Homebrew 사용 (Homebrew가 이미 있는 경우)

만약 이미 Homebrew가 설치되어 있다면:

```bash
brew install ansible

# 설치 확인
ansible --version
```

### 방법 3: Python이 없는 경우

매우 드물지만 Python 3가 없는 경우, 먼저 Python을 설치해야 합니다:

```bash
# Homebrew로 Python 설치 (Homebrew가 있는 경우)
brew install python3

# 또는 공식 Python 웹사이트에서 다운로드
# https://www.python.org/downloads/
```

## 사전 요구사항

- **Ansible**: 위의 방법 중 하나로 설치 필요
- **터미널 접근**: 기본 Terminal.app 또는 다른 터미널 앱

## 사용 방법

### 1단계: Ansible 설치 확인

먼저 Ansible이 제대로 설치되었는지 확인합니다:

```bash
ansible --version
```

정상적으로 설치되었다면 버전 정보가 출력됩니다.

### 2단계: Playbook 실행

이 프로젝트 디렉토리로 이동한 후 playbook을 실행합니다:

```bash
# 프로젝트 디렉토리로 이동
cd /path/to/ansible

# playbook 실행
ansible-playbook playbook.yml
```

실행 중 각 단계가 표시되며, 설치가 완료되면 결과가 출력됩니다.

## 설치 방식

이 playbook은 다음 순서로 작업을 수행합니다:

1. **Homebrew 확인**: Homebrew가 이미 설치되어 있는지 확인
2. **Homebrew 설치**: 설치되어 있지 않으면 자동으로 Homebrew 설치
3. **앱 설치**: Homebrew를 사용하여 다음 앱들을 설치
   - `brew install --cask iterm2`
   - `brew install --cask discord`
   - `brew install --cask aldente`
   - `brew install --cask notion`
   - `brew install --cask notion-calendar`
   - `brew install --cask scroll-reverser`
   - `brew install --cask cursor`
   - `brew install --cask microsoft-edge`
   - `brew install --cask rectangle`
4. **개발 도구 설치**: 다음 개발 도구들을 설치
   - `brew install zsh` (최신 zsh 버전)
   - `brew install git` (Git이 없을 경우)
   - `brew install pyenv` (Python 버전 관리)
   - uv 설치 스크립트 실행 (`curl -LsSf https://astral.sh/uv/install.sh | sh`)
   - oh-my-zsh 설치 스크립트 실행
   - powerlevel10k 설치 (Homebrew 또는 oh-my-zsh 테마로)
   - `brew install zsh-syntax-highlighting` (Zsh 구문 강조 플러그인)
   - `brew install zsh-autosuggestions` (Zsh 자동 제안 플러그인)
   - `brew install zsh-history-substring-search` (Zsh 히스토리 부분 문자열 검색 플러그인)
   - `brew install zoxide` (스마트 디렉토리 점프 도구)
   - pyenv, uv, powerlevel10k, zsh-syntax-highlighting, zsh-autosuggestions, zsh-history-substring-search, zoxide 초기화 스크립트를 `.zshrc`에 자동 추가

- Intel Mac과 Apple Silicon (M1/M2/M3) 모두 지원
- Homebrew가 이미 설치되어 있으면 설치 단계를 건너뜀
- 각 앱/도구가 이미 설치되어 있으면 해당 항목의 설치 단계를 건너뜀
- pyenv, uv 설치 시 `.zshrc`에 자동으로 초기화 스크립트가 추가됨

## 확인

설치 후 다음 경로에서 앱들을 확인할 수 있습니다:
- `/Applications/iTerm.app` (iTerm2)
- `/Applications/Discord.app` (Discord)
- `/Applications/AlDente.app` (AlDente)
- `/Applications/Notion.app` (Notion)
- `/Applications/Notion Calendar.app` (Notion Calendar)
- `/Applications/Scroll Reverser.app` (Scroll Reverser)
- `/Applications/Cursor.app` (Cursor)
- `/Applications/Microsoft Edge.app` (Microsoft Edge)
- `/Applications/Rectangle.app` (Rectangle)

## 설치 후 확인

설치가 완료되면 다음을 확인할 수 있습니다:

- **앱들**: `/Applications/` 폴더에서 확인
- **zsh**: `zsh --version` 명령으로 확인 (Homebrew 버전: `$(brew --prefix)/bin/zsh --version`)
- **Git**: `git --version` 명령으로 확인
- **pyenv**: `pyenv --version` 명령으로 확인 (새 터미널 세션 필요)
- **uv**: `uv --version` 명령으로 확인 (새 터미널 세션 필요)
- **oh-my-zsh**: `~/.oh-my-zsh` 폴더 확인
- **powerlevel10k**: `~/.oh-my-zsh/custom/themes/powerlevel10k` 폴더 확인 또는 `brew list powerlevel10k` 명령으로 확인
- **zsh-syntax-highlighting**: `brew list zsh-syntax-highlighting` 명령으로 확인
- **zsh-autosuggestions**: `brew list zsh-autosuggestions` 명령으로 확인
- **zsh-history-substring-search**: `brew list zsh-history-substring-search` 명령으로 확인
- **zoxide**: `zoxide --version` 또는 `brew list zoxide` 명령으로 확인

**참고**: pyenv, uv, oh-my-zsh, powerlevel10k, zsh-syntax-highlighting, zsh-autosuggestions, zsh-history-substring-search, zoxide는 새 터미널 세션을 시작하거나 `source ~/.zshrc`를 실행해야 적용됩니다. powerlevel10k는 첫 실행 시 설정 마법사가 실행됩니다. zoxide는 `cd` 대신 `z` 명령어를 사용하여 자주 방문한 디렉토리로 빠르게 이동할 수 있습니다.

## 향후 확장 가능한 항목

- Python 특정 버전 설치 (pyenv를 통한)
- oh-my-zsh 테마 및 플러그인 설정
- 개발 환경 설정 파일 (.gitconfig 등)
- Node.js, Docker 등 추가 개발 도구 설치
- IDE 설치 (VS Code, IntelliJ 등)

