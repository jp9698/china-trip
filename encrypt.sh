#!/bin/sh
# Encrypts the dashboard into index.html (the only page GitHub Pages serves).
# Keep exactly one dashboard .html in this folder besides index.html. Run after every edit,
# then commit and push index.html. Prompts for the password, or reads it from STATICRYPT_PASSWORD.
set -e
cd "$(dirname "$0")"

src=$(ls *.html 2>/dev/null | grep -v '^index\.html$' || true)
count=$(printf '%s' "$src" | grep -c . || true)
if [ "$count" -ne 1 ]; then
  echo "Expected exactly one dashboard .html besides index.html, found $count:" >&2
  printf '%s\n' "$src" >&2
  exit 1
fi
echo "Encrypting $src"

npx -y staticrypt@3.5.4 "$src" \
  -d .site-build \
  --short \
  --template-title "China 2026" \
  --template-instructions "Enter the trip password." \
  --template-button "Unlock" \
  --template-error "Wrong password" \
  --template-remember "Remember me on this device" \
  --template-color-primary "#197667" \
  --template-color-secondary "#102b2e"

mv ".site-build/$src" index.html
rm -rf .site-build
echo "index.html updated. Now: git add index.html && git commit -m 'Update dashboard' && git push"
