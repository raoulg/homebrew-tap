class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610240740"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610240740/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "b81a975a76827d42bbcac894915769936caa38257ae42e50805024d76f4d9a80"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610240740/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "fac065473a9a64e4da9928a3c9f84734674f7d87a6512d6d6accc1e20ecb4208"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610240740/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4df0ab4ff92bd0158285cce8996fcf16ac9c60f558ab869ce80128bb4640cae"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610240740/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48aebbe94b8dc6d087955da1633520b498b6a31461fff5e71e812537c940ce08"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
