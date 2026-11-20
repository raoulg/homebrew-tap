class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.75.0-nightly.202611201156"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201156/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "26cc680e4b8e6b81044b7bb44c5fd1a04587119c78e12317b8ea8758b55a1901"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201156/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "72024354155c3ec259464690cc94f5e020d2f160bfd2b5dc9fbae9dac2be98e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201156/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5de412ca47cd15781cf927013aa4bff3ff41d5e0fa34d3e215a4b4de9dc96ff8"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611201156/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5525b86aef5d7f294e5b15f63eafee814e56a0a99124f26c11eda1c1cb2e4e61"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
