class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610212248"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610212248/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "f474658a88b5b18bc93bb9a9debf07b543e4184d399bec6c073d5ae888ffc906"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610212248/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "498728133d7ceee85b677591d0a6e8129a3297165ee2be9d547523c9570494f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610212248/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7678d5615433eec57068dfbd84b7dfc210645bd5b265c21ba4012181770a77b0"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610212248/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f5201bb6c392d59f1ee0930acd8e989b17cbc594ac72fcf5b77666ff59c1131"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
