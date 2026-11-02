class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.71.0-nightly.202611021452"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021452/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "58d647ada7d120d11d089b282c675ee6cf7bb9b38cf4b9ad75eab189e4b32ac0"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021452/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "d8097c6f9492a5cfb164ae694a6b5c9a4e5d631821e467e26532a069dfc2cffb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021452/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78fc513fe1d5a97392e5dee480fa28d8aa64da5fd99474b10f8184a8da179483"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021452/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e427f3812e43ce2491478935a2fdcfefc7b65fb7dc0f761aa6ae8612598b90f2"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
