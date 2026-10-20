class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath the language it is written in: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.67.0-nightly.202610201927"
  license "CC-BY-NC-SA-4.0"

  # The nightly of `next`, a pre-release rebuilt when `next` has moved and its tests are green.
  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"
  conflicts_with "atlas-code", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "53946e5f56294125ebc028fd3a3342b8942e00ad171e9e48fdcd879673ba7fa3"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "3b38a0e2c3832853389ab6b3c5c889e6d37229ba14940b78c61c9ef7ed4ebe25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "925a8344227cd8b6be3d068fdb96ea352230e1128bf83ae73b57d9ac282851f2"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1eced6e41cfba48ad08027f26243b05153997374b32dc981760ddc284f664fc"
    end
  end

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas --version")
  end
end
