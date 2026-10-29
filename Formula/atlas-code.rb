class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.3"
  license "AGPL-3.0-only"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.3/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "8c6872ad372384909c8495dea695abb4ff292f56941462b54cfec5afb6785b65"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.3/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "81ccc54e48746a002349b369e46fc251f344cfdc0d4a22c8d153a958b1e9a6bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.3/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3420b7477226562577074d3e45bddd4e24c005999d526fdb84854de55c4f0de"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.3/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b5af56aeb702ab48969c1479319229382f9eb93d9b8b0d9fa6c8e145286143f"
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
