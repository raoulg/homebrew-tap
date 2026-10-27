class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath its language: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610270827"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-nightly`, beside the release's `atlas`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270827/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "aa83c8ed4c19283bd0c5aac8b4728ae6bf64d4b3dcacc8bd47db30685cdc5b09"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270827/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "a58c30fb5a970b629f437ce5b045dd86dc8ea2406316f5fce5975f64e59d5e87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270827/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c96b8680713bdeda446f1be1d717f232d4c51494f5099d9c17287e906e58b2a"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270827/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77542c8a458ed8842975face9740e599a664589c9d6bb0443056c102b67fa87f"
    end
  end

  def install
    bin.install "atlas" => "atlas-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-nightly --version")
  end
end
