class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.74.0-nightly.202611171208"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171208/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "84256f8a432b1ee892e6c173f92c7cbcecea26755541e4f4970f77fe5321a701"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171208/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "16d8c0721c4d98b61599ac7bcb449f8cf84433560fd38b65a11f31e60ebec1c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171208/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46f6a1e85ac47624c4037b41be7a27e512dd56a6a9b102e1f48d2aae1f3c0f45"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171208/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66fed7c58ed1b9b4e2624890f3d156b53a98b6d54aa5e7f0bc63980f90e72ae3"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
