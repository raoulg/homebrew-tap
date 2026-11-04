class AtlasCode < Formula
  desc "Atlas — your code's topology"
  homepage "https://atlas.pttrn.io/"
  license "AGPL-3.0-only"

  # `brew install --HEAD raoulg/tap/atlas-code` builds the nightly line, `next`, from source.
  head do
    url "https://github.com/raoulg/atlas.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.71.0/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "b70f3beff3cc1f26d5c62080790db44858c44e2b71d112e303e137d3dc541c56"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.71.0/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "71b3c6ee06c908189f41151b2787a378821b979b9bc10c0fa9fd27a84fc91388"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.71.0/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f13705178ee299e77dad4c41f56c4a0be524a971a889a0780f445fde07d22a0d"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.71.0/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f1bcc61bc6f9fa61c3d82d3e3b78624e3ad478f44cab0b1aa4dc5269359193d"
    end
  end

  def install
    if build.head?
      ENV["ATLAS_CHANNEL"] = "nightly"
      system "cargo", "install", *std_cargo_args(path: "cli")
    else
      bin.install "atlas-code"
    end
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code --version")
  end
end
