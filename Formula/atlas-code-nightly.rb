class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.67.0-nightly.202610170915"
  license "CC-BY-NC-SA-4.0"

  # The nightly of `next`, a pre-release rebuilt when `next` has moved and its tests are green.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "8d01d8773841c3ab646780a81021d93ef705e5da08b431988b344d71c45ac890"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "a30177c807a1198149d886c0b1346c7ff08a495890a8f946c2f1e2531ef3fb58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac7eea377f0eaae476dd382e4abe4f83249b1d7ec747e23a64729a523e8d303d"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9984fc7a441355e96311e17e4fbfc7f16f43c9f21e71cb074bdd328480899e77"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
