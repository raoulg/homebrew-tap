class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.75.0-nightly.202611211128"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611211128/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "9e4ec3ccbd3acba004565e9ecbe8cb8ebcda0b02a50d5819120aa2cd28d108dc"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611211128/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "6f0cbdad128ae82887d4059a3bcb61c7a7040bb5b7c5fbdb824a825b38776f6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611211128/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7060d110613d51470a48410793cc14a8896d29bcedcbb3a30ea6e41bc2e1419e"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611211128/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7927548c6f36fe97237daf459b05ac255d0a3839af7014045bd9167d920a00d5"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
