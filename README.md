# Talkink Homebrew Tap

Official [Homebrew](https://brew.sh) tap for **[Talkink](https://talkink.app)** —
push-to-talk dictation for macOS, 100% on-device. Hold a key, speak, release:
your words are pasted at your cursor, in any app.

## Install

```bash
brew install --cask hasso5703/tap/talkink
```

Requires an Apple Silicon Mac (M1 or later) and macOS 14+.

## Update

Talkink updates itself in-app (Sparkle, signed feed). If you prefer Homebrew to
manage it:

```bash
brew upgrade --cask talkink
```

Either path is fine — the cask declares `auto_updates true`, so Homebrew won't
fight the in-app updater.

## Uninstall

```bash
brew uninstall --cask talkink        # removes the app, keeps your settings & history
brew uninstall --cask --zap talkink  # also removes settings, history and downloaded models
```

## Maintainer notes — cutting a release

After publishing `vX.Y.Z` on GitHub (see the main repo's BUILDING.md):

```bash
V=X.Y.Z
SHA=$(curl -sL "https://github.com/hasso5703/talkink/releases/download/v$V/Talkink.dmg" | shasum -a 256 | cut -d' ' -f1)
sed -i '' -e "s/^  version .*/  version \"$V\"/" -e "s/^  sha256 .*/  sha256 \"$SHA\"/" Casks/talkink.rb
brew style Casks/talkink.rb && git commit -am "talkink $V" && git push
```

`brew livecheck talkink` reads the Sparkle appcast at talkink.app and flags the
cask whenever it falls behind the released version.
