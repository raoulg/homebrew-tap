class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.2"
  license "AGPL-3.0-only"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.2/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "91380597dc68fc44c7414dbe70eecf323ee7daeb6fb61da0d3af4c6ece0a8d33"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.2/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "4e603d0e1cf1d6d89980879c773cfdc618f571e80aefcbbf41c304f4c5693b63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.2/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcd778838f2e058187527ed7967487b195935a5c9f2d4d2650174f64e929b5f3"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.2/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5eaa043e220e4ddd3190ee3ddb69144a3f8437f62af77ac908e9fa825aacb769"
    end
  end

  # `brew install --HEAD raoulg/tap/atlas-code` builds the nightly line, `next`, from source.
  head do
    url "https://github.com/raoulg/atlas.git", branch: "next"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      ENV["ATLAS_CHANNEL"] = "nightly"
      system "cargo", "install", *std_cargo_args(path: "cli")
    else
      bin.install "atlas"
    end
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
