#!/bin/sh
# Install the skill from GitHub into a temp project and check it matches this repo.
set -eu
src=${1:-gbarnett-hz/team-review}
here=$(cd "$(dirname "$0")" && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

cd "$tmp"
npx -y skills add "$src" -a claude-code -y >/dev/null
installed=.claude/skills/team-review/SKILL.md

test -f "$installed" || { echo "FAIL: $installed not installed"; exit 1; }
cmp -s "$installed" "$here/SKILL.md" || { echo "FAIL: installed SKILL.md differs from repo"; exit 1; }
grep -q '^name: team-review$' "$installed" || { echo "FAIL: frontmatter name missing"; exit 1; }
echo "PASS: team-review installed from $src"
