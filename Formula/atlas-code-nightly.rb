class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.71.0-nightly.202611032218"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611032218/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "86d42d43802f4cbeec69c4bdeee7224ad6ce641ec78ecc91c7d8e5c102a2b9ac"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611032218/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "52821a7db0f34d8ce3ae6966a81ca19a55e2a156336c72b92e167c198aa45855"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611032218/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e9f0afb7013d36e6b857f933aa671ee0a3c06a1f4a29b1112fb3386e40209c6"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611032218/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "016dda89554e4d262c17eadc2a06a21857a7f6572175387f789b163137c639a1"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
