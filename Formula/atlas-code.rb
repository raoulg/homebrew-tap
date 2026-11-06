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
      url "https://github.com/raoulg/atlas/releases/download/v0.72.1/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "8f773e3fbd05433877449bf938c09addcd74b75be9b5384ac3c9e180489fe2f6"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.1/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "4659445920159eb5a5d6b508c82233bc5f6991d7a0e63d0758727b9976e81431"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.1/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "449d07fc563e111f2e21b7e0c258fa6d78046a9afad5b042e472f576e38b2189"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.1/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92c193d4a8861085d61f6da27b6988638f417fd5de90ea59b436178db718ec68"
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
