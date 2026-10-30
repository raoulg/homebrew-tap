class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.70.0-nightly.202610301407"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610301407/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "60fd29a27113043d351a7b00a3184703e58ed075c2a7d8ad8a9b893cad732c97"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610301407/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "973dc07b0566fed7e7320deb36b6feeadac3c86435aa738ccce50670d1120c92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610301407/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8a6595e007fb8ec3264ddbdb3e1d549197982f2a503b139853b288689db0b7c"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610301407/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b975ff25bf461f9da1b698e1c5d2773f5fddc268defbd1a2cf7522f3834f285"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
