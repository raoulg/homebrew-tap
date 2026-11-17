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
      url "https://github.com/raoulg/atlas/releases/download/v0.74.0/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "7fb1f0460e547d7e84b50431b4329351f1c5a12054dd641dad28ac1cc2fba38d"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.74.0/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "4185a6417a8999c4b39b48771123e1544e38689b3b8e2f9b9db6a1a7fc73a844"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.74.0/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e619649c930fb4e5dda64390c7277602e4beb52008fb7b201e90ced939760e5"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.74.0/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff30415f644e93a9c311f8138f4d849a70822771fc11f9741cadaebe019929c7"
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
