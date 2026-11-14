class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.74.0-nightly.202611140824"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611140824/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "3c00ab9ad6e082630beb916afa7ee0dbd2ecb17b80d5c9843e5ea1b9a2108fb0"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611140824/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "1b526fcbbbbf987fc8e394e16921b4357bc6bdd985134b81c1a1850d6954475b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611140824/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "834cc3271e1a94c9e0eb0d8844315d58fe3b5c28f02e96b7bb5595efce858676"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611140824/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d775d1dfd4d0fe124ddc1c58be33a3517a26d2073f7b454fd0940c2939169bb2"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
