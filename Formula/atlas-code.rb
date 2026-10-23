class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.67.1"
  license "CC-BY-NC-SA-4.0"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.1/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "590066ff81f5c5b916ee30e1f21d50acb3ae41066f3592aaccb73e8c62d84ac0"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.1/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "b55988be28d89bc6fc82a076dd04b73c70b09e8ac948f2b4f40ce421fa1e4b57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.1/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94b0a8d64c3da4fa55cda76c38297caad1ad291bf657228a60d01fa180583185"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.1/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12bd0c1469dd065e53c108384ad8ace8f0e6e02c158591a37a99f227b7ce1770"
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
