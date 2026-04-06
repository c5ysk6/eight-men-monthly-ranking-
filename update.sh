#!/bin/bash
# EIGHT MEN ランキング 毎日自動更新スクリプト

BASE="/Users/c5ysk6/Dropbox (個人)/GM/00_開発・自動化/売上ダッシュボード/ランキング"
LOG="$BASE/em-ranking/update.log"
echo "===== $(date '+%Y-%m-%d %H:%M:%S') 開始 =====" >> "$LOG"

# HTMLを生成
python3 "$BASE/ランキング生成.py" >> "$LOG" 2>&1

# GitHubにpush
cd "$BASE/em-ranking"
git add index.html >> "$LOG" 2>&1
git commit -m "update $(date '+%Y-%m-%d')" >> "$LOG" 2>&1
git push >> "$LOG" 2>&1

echo "===== 完了 =====" >> "$LOG"
