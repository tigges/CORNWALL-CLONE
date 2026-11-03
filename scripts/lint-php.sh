#!/usr/bin/env bash
# Syntax-check every PHP file in the theme with `php -l`.
# Stops and exits non-zero at the first file with a syntax error.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
THEME_DIR="$ROOT/wp-content/themes/cornwall-dry-cleaners"

if ! command -v php >/dev/null 2>&1; then
  echo "php not found. Run scripts/setup.sh first." >&2
  exit 127
fi

if [ ! -d "$THEME_DIR" ]; then
  echo "Theme directory not found: $THEME_DIR" >&2
  exit 1
fi

count=0
while IFS= read -r -d '' file; do
  if ! output="$(php -l "$file" 2>&1)"; then
    echo "$output" >&2
    echo "Syntax error in ${file#"$ROOT"/}" >&2
    exit 1
  fi
  count=$((count + 1))
done < <(find "$THEME_DIR" -type f -name '*.php' -print0 | sort -z)

echo "No syntax errors in $count PHP files."
