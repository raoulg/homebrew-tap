class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.67.0-nightly.202610202010"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610202010/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "d07e0020d9c2e94a7f235ca2294106f8f55105cfe6610e8bc4c7859d0bece6f8"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610202010/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "eabe0318c6c91b490c6fcceff1052a17a818be24e1261f50ab24a29724318c09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610202010/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dacad5b6656f227363f4cbdc9466a7d9f42247ef11b19a3bc0a9c845234e8899"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610202010/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba3d1bd973c9f5ec3c9d02334e0af9b79a1ebe2f6ece09e8e1456b0ee4c89f8e"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
