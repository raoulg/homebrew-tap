class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.1"
  license "CC-BY-NC-SA-4.0"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.1/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "1b707ae7e7c6051af5608e8774e130a050c07537280a825ad3b7c7a6a6f87ddc"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.1/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "4b2288461d799b1d30d265dfff50b8795050b00d2907d488e9c2822da80cca18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.1/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba97214fd88a70f299c21bf5178c9e3cdb9f35929de6b086bd073c7480ff7609"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.1/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b401dc635c670c85089199295522d39498e2c6e1e6a2c26e86ca651daa89286"
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
