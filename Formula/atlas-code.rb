class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0"
  license "CC-BY-NC-SA-4.0"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.68.0/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "498a7ef61f0e2fcc5e2fb2b15633734c9c75da22486b737b310ff1cb5f9a4e9e"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.68.0/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "af1fdc435bf6b3515899dea6ac9abbbc7513092b461efdfbb5f0f26dfb54f259"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.68.0/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b80eb109723ddc927439142f5580256371e088c228ab0a24b698b7d8cff3095f"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.68.0/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96981f241d7ab1f87f66457577dd5cabbe1af75e94b0e8fceb8f973fc4ed2655"
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
