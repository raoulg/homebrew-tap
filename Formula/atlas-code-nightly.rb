class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.71.0-nightly.202611011039"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611011039/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "43368eff1f135a4f65907d9b4aa585ab265fc7e41509d33da7d838e4788577da"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611011039/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "d750563def2836dab4b38b4a36aa877ad4785c6018c35b5959b2ae0e73316474"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611011039/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bec144d3bd9f31481448273c1fe72c573ee3cabd3fc57942c307b68dc9f39f8a"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611011039/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acffb1641870c20bf5cd8cac877947445a496e17d5f74ec8b6a2a884021333db"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
