#!/usr/bin/env bash
set -euo pipefail
VER="${1:?Usage: changelog_split.sh <version_name>}"
FILE="CHANGELOG.md"
OUT="fastlane/metadata/android/en-US/changelogs"
mkdir -p "$OUT"
awk '/## \[/{flag=0} /## \['"$VER"'\]/{flag=1;next} flag' "$FILE" > "$OUT/${VER}.txt"
echo "Wrote $OUT/${VER}.txt"
