cask "atlas-studio" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.69.3"
  sha256 arm:   "15bd09f862383ddcf5c8e41303149d1e646146f372993196c5f41536c405e11f",
         intel: "3134b86ffb2869682103687967031f8ed2b2f81ddc65f4c88cee41ccd28ddce2"

  url "https://github.com/raoulg/atlas/releases/download/v#{version}/atlas-studio-#{arch}-apple-darwin.dmg"
  name "Atlas Studio"
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"

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
