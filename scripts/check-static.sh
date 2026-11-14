#!/usr/bin/env bash
set -euo pipefail
required=(index.html docs.html relay.html support.html discord.html private-communities.html join.html 404.html styles.css script.js assets/favicon.svg assets/animation/signal.gif)
for file in "${required[@]}"; do test -f "$file" || { echo "missing: $file" >&2; exit 1; }; done
grep -q 'support.html' index.html
grep -q 'private-communities.html' index.html
grep -q 'museai@fedpromptly.com' discord.html
grep -q 'matrix.to/#/#fed-os:matrix.org' private-communities.html
echo "static site sanity check passed: ${#required[@]} required files present"
