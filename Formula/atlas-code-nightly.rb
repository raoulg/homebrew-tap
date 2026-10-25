class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610250752"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610250752/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "d096dd7defbf631dc84bc44dab4c8836eaa834b733d0bd773cbbf585692d65e9"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610250752/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "3013c94490b4cbd11c8ca1ef5662000e4e8d6e906ce44f6e98b10159aaff22bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610250752/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "529e47b777c836949646b902d462048a2cc6f1063e817ed160c94dc1619fac27"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610250752/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0ebec2d2a142660cadc4799bb94a10547ca9791e78edfe851bd8a6a20df92f9"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
