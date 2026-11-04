class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.71.0-nightly.202611040840"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611040840/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "ac7537d1943826e90ecc0933650e1fb17378676473a96facd135caae33e843de"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611040840/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "7337236c42694a047c2f0a717b689fcba067a00f6601d3647065f471873718a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611040840/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ddd39553e39df86a2508160ea7e909c8188c91c53afc7fce922bfb14e2bc9815"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611040840/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1eccdfd92d814dac6996cdd49fc3a1beb3cb1ec04eb9c1ea191476c6f38d93a8"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
