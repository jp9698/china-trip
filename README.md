# China Trip 2026

Password-protected travel dashboard hosted on GitHub Pages.

`index.html` is encrypted with [StatiCrypt](https://github.com/robinmoisson/staticrypt) (AES-256, decrypted in the browser). The readable dashboard `.html` stays on this computer only and is git-ignored.

## Updating the dashboard

1. Put the new dashboard `.html` in this folder and delete the old one. Keep exactly one besides `index.html`; any filename works.
2. Run `./encrypt.sh` and enter the password.
3. `git add index.html && git commit -m "Update dashboard" && git push`

GitHub Pages redeploys within a minute or two.
