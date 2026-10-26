class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.68.0-nightly.202610261819"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610261819/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "cecf6bf1b4015faa623d9191b64efd90c9071f82d6f9848157efe5737c5a1b41"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610261819/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "736700b8862a78942f4a5101122e8a72d1a3ceb309f45f62a71d91364cfeae6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610261819/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b2419ecf953155d3118babed36911a3b88ce206a98fc3a3f0e0e4863651964d"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610261819/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e33760502ff52df5575fb1e265ad426233a2ab9176cde94f5577982e1b4031d"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
