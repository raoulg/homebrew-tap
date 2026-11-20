class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.75.0-nightly.202611201203"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201203/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "0d19fb4c13b6423aa194f4a6d658e5c7f7dee37ecef2448f955c71588a1ba201"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201203/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "e229ae88c6548463024f35436bc6f6bace661e2d1a4db63331f6e9577fd2e561"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201203/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06183df9e12c6b75999943f2b3e1533f935a156d7b33e64bf30a27c2df35a489"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201203/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c283c63d1432603647893c7c6c3ea045f5f7e65ed3679e48c381ad8a0fb433ba"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
