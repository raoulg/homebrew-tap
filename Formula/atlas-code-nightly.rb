class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.71.0-nightly.202611022152"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611022152/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "4b8327f57b6809d14d80c720bf4eac2143795aa766ea04ac53a2601cea92066d"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611022152/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "30273eedaa04efc314c4a1ab29a6099d535f2d5259cae7b1ef1a025d8e6eb0de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611022152/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac0a965126f038a69fe4791d2e84de5aaebe859c2fc6833e4c504c8112a635fe"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611022152/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2c60989b328e707460e0d0401335c488708cc7dd99432e1195869584607364d"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
