cask "atlas-studio-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.75.0-nightly.202611201156"
  sha256 arm:   "32497fd9622aa4f232ccc0e115fd35d912eb95ee7f1a17c1c5af65f43e8eb6bc",
         intel: "bdf59380896fa9c070a1402bbc095e7f882dba423ab634c0eef6c740738dcb98"

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
