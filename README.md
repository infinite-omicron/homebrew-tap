# infinite-omicron/tap

Homebrew tap for [hiccup](https://github.com/infinite-omicron/hiccup), which drives Burp Suite, ZAP or mitmproxy from scripts and agents.

```sh
brew install --cask infinite-omicron/tap/hiccup
```

The cask works on macOS and Linux (arm64 and amd64). It installs the `hiccup` binary and `hiccup-burp.jar`, which `hiccup burp start` finds automatically. `Casks/hiccup.rb` is updated by hiccup's release workflow on every release.
