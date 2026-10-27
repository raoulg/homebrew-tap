class AtlasCodeNightly < Formula
  desc "Draws what a program is, beneath its language: the nightly build"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.0-nightly.202610270906"
  license "CC-BY-NC-SA-4.0"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-nightly`, beside the release's `atlas`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270906/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "0fe2d82944af72f07f9884bb5be97c0bc5774cd893e5f0194450166d22895edf"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270906/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "4054fdaa18e2d583505504da1be9ec9c488b7da843b63b97ee44e0108c73b600"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270906/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eee0bdd0a7334e6387037bbd4dd26b37745dcc2fb7537a8d8f4be04ad58d6f38"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202610270906/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dfe4617fddfaa65c449133d05fb04a8107451743d9f0e7f9f2b8314c96f5c7b"
    end
  end

  def install
    bin.install "atlas" => "atlas-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-nightly --version")
  end
end
