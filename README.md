# homebrew-tap

Homebrew tap for **16bit**.

## Install

```bash
brew tap 16bit-xyz/tap
brew install --cask --no-quarantine 16bit
```

Binary assets come from [`16bit-xyz/16bitReleases`](https://github.com/16bit-xyz/16bitReleases).

## Update cask after a release

1. Note the new tag/version in `16bitReleases`
2. Download the darwin zip assets and compute `sha256`
3. Update `Casks/16bit.rb` `version` and `sha256`
4. Commit and push

## Notes

- No Apple Developer ID signing yet; `--no-quarantine` is recommended
- App binary name: `16bit`
- Data folder: `~/.16bit-editor`
