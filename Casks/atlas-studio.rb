cask "atlas-studio" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.69.4"
  sha256 arm:   "09c836a800d0650cb575600571530e4c87251f24d860708866d538059ec41ce9",
         intel: "3e2ea26bbecafb4825a62dca422499464237dbbb26699dee788fd6fb3f23eeb1"

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
