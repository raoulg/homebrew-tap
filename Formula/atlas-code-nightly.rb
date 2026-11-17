class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.74.0-nightly.202611170733"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611170733/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "c2556d71292c1cc5e5128506c772d3c7629a5ec758916e7f9675854f1f9df1f5"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611170733/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "7f6d1a72fd7176260d911c686cd3799b48f93a70980026a000e9ffdbedc0c9f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611170733/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da39bf01b3354f7bff77a90ef52e10e16d49be52315710a695deb4b6b125b556"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611170733/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aff2348d28015157b09c1ee3c5079836cee210444a475b036c2bef2292e75780"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
