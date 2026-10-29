class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath its language: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.2-nightly.202610290901"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-nightly`, beside the release's `atlas`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610290901/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "abcf7aad0a59424b9495ed306378b6caa124e4810fac7d1327dc3e44b7369a9a"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610290901/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "8b26e0b0e123a05255d9bc09dbf707a18c913c5ce2ecb38f9baaa6f9538283f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610290901/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "026c2e21bad9402c15f804afdf0cda409b0849f44ae1fee3d6f3e064b0da1f0c"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610290901/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5138a6c4d9f78b31428910314c4bfef57c5b4fb6ac91f2815de261a575208d6"
    end
  end

  def install
    bin.install "atlas" => "atlas-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-nightly --version")
  end
end
