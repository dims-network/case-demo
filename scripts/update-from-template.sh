#!/usr/bin/env bash
#
# Pull the latest dashboard code from the upstream template into this canonical
# data repo. Code (js/, css/, opt/, index.html, serve.py, .github/) tracks the
# template; this repo's data (config.json, assets/) is preserved.
#
#   Upstream: https://github.com/dims-network/DIMS_dashboard_template
#
# One-time per clone (so config.json auto-resolves to ours on merge; see
# .gitattributes):
#   git config merge.ours.driver true
#
# Usage:
#   scripts/update-from-template.sh [branch]    # default branch: main
#
# To test an unmerged feature branch before it's blessed upstream:
#   git checkout -b test/<feature> && git merge template/<feature-branch>
#   python serve.py 8000   # verify against real data, then discard or keep
set -euo pipefail

BRANCH="${1:-main}"
cd "$(dirname "$0")/.."

if [[ -n "$(git status --porcelain)" ]]; then
  echo "error: working tree is not clean — commit or stash changes first." >&2
  exit 1
fi

if ! git remote get-url template >/dev/null 2>&1; then
  git remote add template https://github.com/dims-network/DIMS_dashboard_template.git
fi

git fetch template "$BRANCH"
git merge "template/$BRANCH"

echo
echo "Merged template/$BRANCH. Verify against real data, then push:"
echo "    python serve.py 8000"
echo "    git push"
