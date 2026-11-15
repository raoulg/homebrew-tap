class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.74.0-nightly.202611151116"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611151116/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "7a83a6e68f2ea71306c9499e495646e71119cd3d7f1d5412bf1eacb4dfcf6ed6"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611151116/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "9035feaed23e1fd83497d127c4ab37c3dec50a670097724fea8295c4b459213e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611151116/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79efb7506ef0f4948e50712d9a243651e5b60ad9037279cf8ab5251b65d1ae1b"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611151116/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e6952198a1d9abc92bb14e67d52f3f6f8a01e22004661a65509fac6dd48a7d6"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
