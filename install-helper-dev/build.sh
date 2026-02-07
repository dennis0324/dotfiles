#!/usr/bin/env bash
# install-helper Nuitka 빌드 스크립트
# pyenv 사용 시 libpython 경로 자동 감지

set -e

PYTHON_BIN="${PYTHON_BIN:-$(pyenv which python 2>/dev/null || which python3)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# pyenv 기준 libpython 경로 감지 (macOS: .dylib, Linux: .so)
PYENV_ROOT="$(dirname "$(dirname "$PYTHON_BIN")")"
LIB_DIR="$PYENV_ROOT/lib"
LIBPYTHON=""
for f in "$LIB_DIR"/libpython*.so; do
  [ -f "$f" ] && LIBPYTHON="$f" && break
done

INCLUDE_LIBPYTHON=""
if [ -n "$LIBPYTHON" ]; then
  echo "libpython 감지: $LIBPYTHON"
  INCLUDE_LIBPYTHON="--include-data-files=$LIBPYTHON"
fi

uv run python -m nuitka \
  --standalone \
  --assume-yes-for-downloads \
  --onefile \
  --follow-imports \
  $INCLUDE_LIBPYTHON \
  --output-filename=$SCRIPT_DIR/../install-helper \
  main.py

echo "echo "빌드 완료: $SCRIPT_DIR/install-helper" 2>/dev/null || true
