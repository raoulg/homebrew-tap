class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.73.0-nightly.202611081036"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611081036/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "890f52d19adb36b3d2f7f872bc6c1fdd41e361fb570de3ca7807366c0d0fe0fc"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611081036/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "06b68318750b36fe7ef73612097767ad0e9b865a848875fd8ca6d34d34bb0ded"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611081036/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a860101c246186291528c29bcdb5bb66812824c7798b4cd5f5b18abf1b80a915"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611081036/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71fb26edd2a81611e4b184b2b7bd5fc7fa841eac2c53b1917627446ed4497ffd"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
