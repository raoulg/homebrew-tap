class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.71.0-nightly.202611021128"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021128/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "f52aed77b9599d3365e2145e6ff879ce95f790b11a8b0e02c59de51def3166b7"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021128/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "8c7430ba3115affe9f93d4422340edf5cd19d82b93ca4ea5daa1cc6c27a304a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021128/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70e046a36111e64322b58ddcb98ab4fa2a4acffe039ffa47f3d162d2bf832641"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611021128/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "388975754b40067bd1931cffb4cb7cc98e8f355f9e917238990eae98b510bef2"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
