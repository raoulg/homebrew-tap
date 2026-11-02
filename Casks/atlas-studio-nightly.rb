cask "atlas-studio-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.71.0-nightly.202611022152"
  sha256 arm:   "07a31148e94a1dab2e291b530ef962530cee7074fff5c1bf429c802485851438",
         intel: "9d11adfafa35234f70be3a55cd4b962f6a0d46c813013e0151435d3ec71ff0ea"

  url "https://github.com/raoulg/atlas/releases/download/nightly-#{version.split(".").last}/atlas-studio-#{arch}-apple-darwin.dmg"
  name "Atlas Studio Nightly"
  desc "Draws what a program is, beneath its language: the nightly build"
  homepage "https://atlas.pttrn.io/"

  auto_updates true
  depends_on :macos

  app "Atlas Studio Nightly.app"

  zap trash: [
    "~/Library/Application Support/io.github.raoulg.atlas-studio-nightly",
    "~/Library/Caches/io.github.raoulg.atlas-studio-nightly",
    "~/Library/HTTPStorages/io.github.raoulg.atlas-studio-nightly",
    "~/Library/Preferences/io.github.raoulg.atlas-studio-nightly.plist",
    "~/Library/Saved Application State/io.github.raoulg.atlas-studio-nightly.savedState",
    "~/Library/WebKit/io.github.raoulg.atlas-studio-nightly",
  ]

  caveats <<~EOS
    Atlas Studio Nightly is signed ad hoc, not with an Apple Developer ID,
    so macOS blocks its first start. Open it once, then allow it in
      System Settings > Privacy & Security > Open Anyway

    It installs its own updates (Atlas Studio Nightly > Check for Updates...),
    which open without asking again. `brew upgrade --greedy` installs
    a new copy that macOS asks about once more.
  EOS
end
