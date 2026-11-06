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
      url "https://github.com/raoulg/atlas/releases/download/v0.72.0/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "da2c79b24764a8a2da8d5ab2647f21e51ec1de683211200e82c20cc3a5f15fdc"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.0/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "3b69b7b7b4fb06f78f93a8d57ba92a37ac787816fa140af49acc99c0750f8563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.0/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb5b87974d2f9d05d58fe2740f849d5973678a7364741a703c7274796dcde0f2"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.72.0/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71adf3128fa79888209117e9743f06878cb880fa36a7ce9e5d7d0d38925e2b98"
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
