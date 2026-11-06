class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.73.0-nightly.202611061426"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061426/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "ae887733f72b64f061738380843ff48f4c11303525398fa84e07295f00eb74ac"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061426/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "35e1e7be4857014d5945739d023a664556495f4af33db53cc40795de6480c077"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061426/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "177f30256fcdd104534bbb3c922b15c22ec58ee35657986f93e710a375ba9e73"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611061426/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56b0a2672f63ac453c34ff65b3a7ca476c0739328366ba1be18f98797adac98b"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
