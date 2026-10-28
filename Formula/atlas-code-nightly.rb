class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath its language: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.0-nightly.202610280904"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-nightly`, beside the release's `atlas`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610280904/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "78d25daf8a4b8577adbe3e764ebfb66730152e0980c92e483f95ad3fc4e1c4da"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610280904/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "7f139a45ff33b3979811c5294e905292ba84e46a9b75903b327b227b66f6e019"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610280904/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "253268b20cdc5c55f0b1bf7ba99c9f00a13af50a264780280e31193d11e9b7a1"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610280904/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfaab6489be094a9a8e19187c049b1d5b51a882439854de0ab61df4bb8240991"
    end
  end

  def install
    bin.install "atlas" => "atlas-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-nightly --version")
  end
end
