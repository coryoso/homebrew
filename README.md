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

Posty's source and release downloads are private. Sign in with `gh` using a GitHub account that has access to `coryoso/posty`, then run:

```bash
HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)" brew install --cask coryoso/homebrew/posty
```

Use the same token environment variable when upgrading. This tap stores only the cask definition; the app stays in the private repository.
