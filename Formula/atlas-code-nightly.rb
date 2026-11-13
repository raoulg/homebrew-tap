class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.74.0-nightly.202611130913"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611130913/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "df6770f8f619bb878f7101d930b8e43f720d2c2eea20328ddf370353022b0ecf"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611130913/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "187a6a1ead3409ca9d59d65a0272b9f94ecb29afda6bc48efac0a94ed6498b2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611130913/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3a5d5f1846e7e59c8781332b824590730d847d8b3f57cb64339c7575bce295e"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611130913/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a762fc900a73676eb3f590aa9e87192a87dce73d132b3976b044c180a08662c"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
