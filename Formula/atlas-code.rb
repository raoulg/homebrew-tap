class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.0"
  license "CC-BY-NC-SA-4.0"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.0/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "05b63c80008faa819c6eb35e5fa96c0d8c3b41a6b2a96a99c0d3cb545a132adf"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.0/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "6c149eb681c6e130ad0616841d068929cb4b6bee0ffa00536718a68c6a1d1f1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.0/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1fc097b61b6932d33f5ffef4b8528285465bc29fdde7b994180ce3233b8381f8"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.0/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67d4a89b4d34d9639251b8e96dd747022d144afd30c4fbaa0808a2a5810844b7"
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
