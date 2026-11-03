#!/usr/bin/env bash
# Cloud / container environment setup: PHP CLI with the extensions WordPress
# tooling needs, plus WP-CLI at /usr/local/bin/wp.
# Safe to run more than once. Needs root (or sudo).
set -euo pipefail

SUDO=""
if [ "$(id -u)" -ne 0 ]; then
  SUDO="sudo"
fi

export DEBIAN_FRONTEND=noninteractive
$SUDO apt-get update -y
$SUDO apt-get install -y --no-install-recommends \
  php-cli php-xml php-mbstring php-curl php-zip curl ca-certificates

if ! command -v wp >/dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL -o "$tmp" https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  php "$tmp" --info >/dev/null
  $SUDO install -m 0755 "$tmp" /usr/local/bin/wp
  rm -f "$tmp"
fi

php -v | head -n 1
wp --info --allow-root | grep -E '^WP-CLI version' || true
