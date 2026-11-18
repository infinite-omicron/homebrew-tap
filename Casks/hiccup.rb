cask "hiccup" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.0"
  sha256 arm:          "dd786aac50e9ff8f285d6485b3f9fd3d46048c61641d9eb6865b5b73b8320c6c",
         intel:        "bde7f9e57a52a3f51bb16915e5674bf5036850168feb54bf9bb1d3d9ddf2b090",
         arm64_linux:  "60a65573c5cc7e99acab7cb75e65e80499e01272059d0e24484c0ccd76930dc9",
         x86_64_linux: "9b90098bac800dda822982ca35b577a07e9b97878ca70bc1dd5d4a98b82bef01"

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

  postflight do
    # The binaries are not notarized; clear the quarantine flag so macOS runs them.
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", staged_path.to_s]
    end
  end

  zap trash: "~/.hiccup"
end
