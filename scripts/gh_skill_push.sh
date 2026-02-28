#!/usr/bin/env bash
# gh_skill_push.sh - Wrapper to push current branch and create a PR via GH CLI
set -euo pipefail
BRANCH=${1:-$(git rev-parse --abbrev-ref HEAD)}
REPO=${2:-$(git remote get-url origin | sed -n 's#.*/\(.*\)\.git#\1#p')}

# ensure gh auth helper for git
git config --global credential.helper '!gh auth git-credential'

echo "Pushing branch $BRANCH to origin..."
git push -u origin "$BRANCH"

echo "Creating PR via gh..."
gh pr create --title "[auto] $BRANCH" --body "Auto PR from gh_skill_push" --head "$BRANCH" --base main || true

echo "Done. PR: $(gh pr view --json url -q .url || echo 'none')"
