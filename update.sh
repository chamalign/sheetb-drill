#!/bin/bash
# 新しい index.html を差し替えて GitHub Pages に反映する
# 使い方: ./update.sh /path/to/new/index.html
set -e

if [ -z "$1" ]; then
  echo "使い方: $0 <新しいindex.htmlのパス>"
  exit 1
fi

NEW_INDEX="$1"

if [ ! -f "$NEW_INDEX" ]; then
  echo "エラー: ファイルが見つかりません: $NEW_INDEX"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

cp "$NEW_INDEX" index.html
git add index.html
git commit -m "Update index.html"
git push

echo "更新を push しました。"
