class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610260812"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610260812/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "33d1c2e2599e3551754de18dcc52d9491496ec7d901754fab2969e300afab95b"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610260812/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "7f5cd37003d3bcf905a955d2809b986f45683918b4da61cd3e61f5f0049b7939"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610260812/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76a495066090339b2f30b9b4b8aca95fd1cd81542f7bfe6db94286947254a7c2"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610260812/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ac1e8b726fd365559fe85f8d62e3dfab202a9367a1c68361e15cba965209488"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
