class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610230801"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610230801/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "1d5cefc3b198e02edafbcb3670be6ad2f759b8f2e70adbdd721e634ba5a009c5"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610230801/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "085242a5589f11225d926dfa59866ead686fbceb04750441b6065b065f335488"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610230801/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc67b97f571d38c6e84b77a117ed21fbc0191a886a1b3d81680721361865a87f"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610230801/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d64f623ae1c6717a0ec82d97ef8a108b22b11308c2a36dedaf28563212064b5"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
