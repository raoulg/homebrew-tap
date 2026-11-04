class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.72.0-nightly.202611041116"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041116/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "1d38f1f491627146e4db49c0f9835dbe6ed0d898250ac36bf6816a6008b280e7"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041116/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "de06310c31d65305ff137da5afe88d665a04982ced8f602632186a68ba7036a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041116/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78bade5da9675a0567e6770bbb1a7fd45a4fad1bc495b44a81dafcfcc1547ada"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041116/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea1e980ba8f700e92a3c97671e0df4480ef254c4d55974a895a06bb87cbf229b"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
