#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Lint and format staged files
npx lint-staged

# Verify TypeScript staged files
npx tsc --build .
