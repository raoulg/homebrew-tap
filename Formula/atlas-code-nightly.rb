class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610241045"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610241045/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "e0f5a89cb1fa1684ff2fa18b46849b450254271d97fad7e634c9d37ff680ccf0"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610241045/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "ffe61b0634c1cf09f2d3794a94aaca9d11f3f137d1fe263b1a39e0356eb27df1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610241045/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ec14c50e13dc6b1ca334bd80656ac253f616329cb1978ca1e040051247da9fc"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610241045/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68b45946c99ab08b185c20685f8cff54f03db8fee238d2bd3b2459206b3c0ef6"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
