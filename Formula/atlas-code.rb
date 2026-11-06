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
      url "https://github.com/raoulg/atlas/releases/download/v0.72.2/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "d6b9277777953a6c6e216152777e989548886da1174dd00dd571362889131c8c"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.2/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "dce2ca5b24ae4845c4de63b4991f2fe8f71171d414e0b07f1729ce96963206b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.2/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fbe599f65d8700269e3140b81f43db366e4042a3876df583888d417c0cc0a1e"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.2/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84e6165bf650c3e7bb31e3e4ac444b7aff5bfaa0ed85745136cc26a2eeb05b91"
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
