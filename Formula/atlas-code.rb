class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.66.2"
  license "CC-BY-NC-SA-4.0"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.2/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "82c4011f6431d57e290b891d3ebd2cd540e0709b7b640787020ab171d0aacca5"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.2/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "4500e5bac809cf933e258bf2bbd7eff2763a45e645637fadc47d96d798692fea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.2/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "665c4bed5cac0339bd5aef6b8f30d1a3ddacac2c2e19b2e623e9fff1c8004907"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.2/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e5119068ff678f41825b9640dd60f15cbc719a5fb59b6fea7a49290d563043f"
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
