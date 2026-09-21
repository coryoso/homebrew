# Homebrew

Public Homebrew tap for my projects.

Add the tap with:

```bash
brew tap coryoso/homebrew https://github.com/coryoso/homebrew.git
```

## Formulae

### Paperless

Install the local-first document intake and filing service with:

```bash
brew install coryoso/homebrew/paperless
```

Stable upstream releases update their formulae in this repository automatically. Release binaries, checksums, and release notes remain in each upstream project; this tap is only the Homebrew formula index.

## Casks

### Posty

Native macOS PostgreSQL client for Apple silicon and Intel (macOS 26+). Releases are signed and notarized.

Install the signed app with:

```bash
brew install --cask coryoso/homebrew/posty
```

If Homebrew requires cask trust, review the cask and run `brew trust --cask coryoso/homebrew/posty`, then repeat the install command.

Source, release downloads, and release notes are available in [coryoso/posty](https://github.com/coryoso/posty). No GitHub token is required. Update with `brew update` followed by `brew upgrade --cask coryoso/homebrew/posty`.
