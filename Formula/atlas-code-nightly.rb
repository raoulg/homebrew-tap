class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.67.0-nightly.202610201926"
  license "CC-BY-NC-SA-4.0"

  # The nightly of `next`, a pre-release rebuilt when `next` has moved and its tests are green.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "35f5d5106ff6fdcc484a2c3c226fef85198ce345e311763dc9a305a20b4c8538"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "0d6b79cf7453bc41c17fcaee7a7bbbb7a111b0e29c9fff5801629baa7eff7275"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a7b556499fc37d061818e3579970ef3a32420844062000b2dae36a81fd062cd"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d2ed8302a6eb1da05c619643b44a74e4d6465301cc4abcd10124c39a0be10fe"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
