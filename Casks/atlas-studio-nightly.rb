cask "atlas-studio-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.74.0-nightly.202611140824"
  sha256 arm:   "704afbf5fe35edde5e773772cb306d32e511db955a5736679eacc42a2df4fac2",
         intel: "220fb7b41747264a8664385ebf2fe8a4cab3beb1f89236c26641e3c6ba75f381"

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
