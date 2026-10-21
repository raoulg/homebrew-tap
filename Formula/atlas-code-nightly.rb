class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610210803"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610210803/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "7bfdddd5a0565423a64b9017a19c08625c17f8064f50625734b18f31e11c7ae8"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610210803/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "ee8a4e0870240cb2899d5d214513e90aab52d92694401c98ce289bdc9b157931"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610210803/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79dcd2af551be5b81826e5a97bb45776496c6b62aaa6caff4b0dda6883dde14c"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610210803/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8da07f5d0e43aa98c942d000aa2206f9fb051a41df2ac4faa1eb2213623b40ab"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
