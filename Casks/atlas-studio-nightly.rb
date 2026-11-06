cask "atlas-studio-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.73.0-nightly.202611061426"
  sha256 arm:   "30564dc23a0bd90ab60ba26937d779159dfc54174c111739d2ac6bdaff580a95",
         intel: "c3e215218b21e1311710f10cf56068c585cc0a5b9ae2410f0e004dd50a560a8a"

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
