cask "atlas-studio-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.70.0-nightly.202610301407"
  sha256 arm:   "63a45faa44b37e3bd600f4ef1db99bb4c2dfab941462c4f2b51ea7cc6c0a41a0",
         intel: "0ce18d461decdb12394d910c501e8604c7a9c7fcdef505e28661dc913a411e27"

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
