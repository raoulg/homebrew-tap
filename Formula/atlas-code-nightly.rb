class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.73.0-nightly.202611071230"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611071230/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "0678d01033964d0c003271d740d9a3aa265aa86c88ce67a75093951827572bb1"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611071230/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "5b99ee3746554812af8d2c64947dfa4fdb916a21127f95cd1dcfdf72aa1b3ab2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611071230/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "566cfaec6e4dad7c22dd4588873a903f917e0105182b55e72c8665e0e3086125"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611071230/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebace3fe74245bf238b9950721a74f92596c10d344ba1619db168f669fc8ad43"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
