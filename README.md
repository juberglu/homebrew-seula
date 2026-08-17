# Homebrew tap for Seula

Seula is a photo culling app for macOS: https://seula.app/

```sh
brew install --cask juberglu/seula/seula
```

The cask points at the notarized DMG published in
[juberglu/seula-releases](https://github.com/juberglu/seula-releases/releases).
Seula updates itself through Sparkle, so the cask is marked `auto_updates true`
and `brew upgrade` leaves it alone.
