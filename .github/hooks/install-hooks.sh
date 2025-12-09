#!/bin/bash

# Script to install git hooks for branch protection
# Run this script from the repository root: .github/hooks/install-hooks.sh

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)

if [ -z "$REPO_ROOT" ]; then
    echo "Error: Not a git repository"
    exit 1
fi

HOOKS_DIR="$REPO_ROOT/.github/hooks"
GIT_HOOKS_DIR="$REPO_ROOT/.git/hooks"

echo "Installing git hooks for branch protection..."

# Install pre-push hook
if [ -f "$HOOKS_DIR/pre-push" ]; then
    cp "$HOOKS_DIR/pre-push" "$GIT_HOOKS_DIR/pre-push"
    chmod +x "$GIT_HOOKS_DIR/pre-push"
    echo "✓ Installed pre-push hook"
else
    echo "✗ pre-push hook not found in $HOOKS_DIR"
    exit 1
fi

echo ""
echo "Git hooks installed successfully!"
echo "The pre-push hook will prevent direct pushes to main/master branch."
