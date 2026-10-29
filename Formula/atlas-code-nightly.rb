class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.70.0-nightly.202610291807"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610291807/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "8393fa52de700eb484236a56611a6dd79eb3699fb96ba84604b58c4ca9b23642"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610291807/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "5d986783e91d096e2e78c651dd4de32bcd17d1fc607e9bfc1149d4daf0a7d83c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610291807/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0553e02e5dd58fbb289c39390087a6c10c0425147ed3293cc470140919df7512"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610291807/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9052320cb59c2a503fc6e215f7d114b21220ef6c1116fbc939162916d6f08ee"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
