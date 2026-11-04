cask "atlas-studio" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.71.0"
  sha256 arm:   "c0b6a3f05194af3c48fddf761ce991fe4e4228ce86e9b32f0bf210b42052be2b",
         intel: "a32367afd0f76f72fe63b090b54211786e1af511cd9dac0738a4b711140903af"

  url "https://github.com/raoulg/atlas/releases/download/v#{version}/atlas-studio-#{arch}-apple-darwin.dmg"
  name "Atlas Studio"
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://atlas.pttrn.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Atlas Studio.app"

  zap trash: [
    "~/Library/Application Support/io.github.raoulg.atlas-studio",
    "~/Library/Caches/io.github.raoulg.atlas-studio",
    "~/Library/HTTPStorages/io.github.raoulg.atlas-studio",
    "~/Library/Preferences/io.github.raoulg.atlas-studio.plist",
    "~/Library/Saved Application State/io.github.raoulg.atlas-studio.savedState",
    "~/Library/WebKit/io.github.raoulg.atlas-studio",
  ]

  caveats <<~EOS
    Atlas Studio is signed ad hoc, not with an Apple Developer ID,
    so macOS blocks its first start. Open it once, then allow it in
      System Settings > Privacy & Security > Open Anyway

    It installs its own updates (Atlas Studio > Check for Updates...),
    which open without asking again. `brew upgrade --greedy` installs
    a new copy that macOS asks about once more.
  EOS
end
