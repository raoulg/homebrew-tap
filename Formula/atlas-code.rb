class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.67.0"
  license "CC-BY-NC-SA-4.0"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.0/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "4ef737bdbf9981c8d2c3897bd0a40c85b68fa544ed841ffa213e4ac46f015d9c"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.0/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "9b0fd5c1b60125661bf26c282f764ec0da31734ca89793e5bd2a6ecb855ae2e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.0/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7447d4ed5fe5d8a941123554aaa70872c42e7ab916a44ac16743402ebd70d8b"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.0/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b292f8c33397c7a0c48e10ef7c3c17410d9f5957e2d06d2a5f0adbc4000645d"
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
