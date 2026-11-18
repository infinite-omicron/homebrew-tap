cask "hiccup" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.2.0"
  sha256 arm:          "48259b2e32151f5288e557fdadacf1907d79ec45fcd18260acdce2f82af88285",
         intel:        "3f78f86a064b809e222080c25aeddb7ee5a8fb934d5fa9ddfbdab57e11929549",
         arm64_linux:  "7ed795ac84edaa47bfb1e5facd047d148e9aaf3d322cb35909d2c2d83aac613b",
         x86_64_linux: "95635dcbe59a74d4042f37b2b536f97497181e4194f1ac6c4c30f1c18620e2b5"

  url "https://github.com/infinite-omicron/hiccup/releases/download/v#{version}/hiccup_#{version}_#{os}_#{arch}.tar.gz"
  name "hiccup"
  desc "Drive Burp Suite, ZAP or mitmproxy from scripts and agents"
  homepage "https://github.com/infinite-omicron/hiccup"

  livecheck do
    url :url
    strategy :github_latest
  end

  # hiccup finds hiccup-burp.jar next to its binary, so it stays in the staged folder.
  binary "hiccup_#{version}_#{os}_#{arch}/hiccup"

  postflight_steps do
    on_macos do
      # The binaries are not notarized; clear the quarantine flag so macOS runs them.
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "."], chdir: "."
    end
  end

  zap trash: "~/.hiccup"
end
