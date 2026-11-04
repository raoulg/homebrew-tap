class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.72.0-nightly.202611041525"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041525/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "63d9a7081e9bf433c424e3b9ac16652e2c55d9316d77189c2a6a5f5b3429d10f"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041525/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "e69bef42f63596e9251a105e1c28141e73d8f3fe382a54d1445d4cd7f7508306"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041525/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e7d27c2fe7c78a2c96e85c6fc97c7a6b7034f3c75e3faefeccb4c1dffa7cbac3"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611041525/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d2b41ca2dc3f68696fbb95a14d1605e8c3e30f961b9951822818eebe9b48133"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
