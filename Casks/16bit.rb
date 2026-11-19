cask "16bit" do
  arch arm: "arm64", intel: "x64"

  version "1.99.30001"
  # Update sha256 after the first macOS assets land in 16bitReleases.
  sha256 :no_check

  url "https://github.com/16bit-xyz/16bitReleases/releases/download/#{version}/16bit-darwin-#{arch}-#{version}.zip",
      verified: "github.com/16bit-xyz/16bitReleases/"
  name "16bit"
  desc "AI-native code editor by 16bit.xyz"
  homepage "https://github.com/16bit-xyz/16bit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :monterey"

  app "16bit.app"
  binary "#{appdir}/16bit.app/Contents/Resources/app/bin/16bit"

  zap trash: [
    "~/.16bit-editor",
    "~/Library/Application Support/16bit",
    "~/Library/Caches/16bit",
    "~/Library/Preferences/com.16bit.editor.plist",
    "~/Library/Saved Application State/com.16bit.editor.savedState",
  ]

  caveats <<~EOS
    16bit is currently unsigned. If macOS blocks the app, install with:

      brew install --cask --no-quarantine 16bit

    or clear quarantine once:

      xattr -r -d com.apple.quarantine "#{appdir}/16bit.app"
  EOS
end
