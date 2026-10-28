cask "atlas-studio" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.69.2"
  sha256 arm:   "754865c38c92efbef68d0bdf202ca14f367b36aaa56f3fb3fd0df3def15639ee",
         intel: "d3ed45b62a9f7cee41a8a912be984b2ad22d4379d985186617e20fe0dc335454"

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
