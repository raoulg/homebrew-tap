class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.73.0-nightly.202611061112"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061112/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "2a4b50b17b5222bc899d7b72f2d45f9ee0238c8b1f84e2bebbcc8bb7e4ad1841"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061112/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "e6bc59892e1063cb3a416e4d518a449493e34861b23896413b585525c0bd2710"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061112/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03b4505240f1764296dcfbaaab016beeaaaa336398815ced5048d16c53d571c2"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061112/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db5a6702d06de8038be71dbfda351f62c9e65544b61e19567f229452bb0a21bb"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
