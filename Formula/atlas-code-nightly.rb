class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.74.0-nightly.202611171037"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171037/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "512550451fe39c07633a578595e2485b5e9f0e7381c37b77afde53d919f9c4f7"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171037/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "3636f275b54b70c8b07eef09d1085522fef89edeb0f8df589d456b1603d8ffb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171037/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3753b7cc4180cc0df466c414fcd71f82c523e8079ec02c79f9349da21804a039"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611171037/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2404169f241718eb3c84159e940af9a1541e4289f0318befdca8eef45afc92da"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
