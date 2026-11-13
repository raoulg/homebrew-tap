class AtlasCodeNightly < Formula
  desc "Atlas — your code's topology: the nightly build"
  homepage "https://atlas.pttrn.io/"
  version "0.74.0-nightly.202611131116"
  license "AGPL-3.0-only"

  # A nightly of `next`, built when `next` has moved and its tests are green: one pre-release per build.
  # It installs `atlas-code-nightly`, beside the release's `atlas-code`.

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611131116/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "186b503ac6d147df1083b305c2b8566db8fc5047f579f5ff219768aca85f297d"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611131116/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "d8fbde3f10e53a5475a4acf4d8d3d79f9bcdb9b1a8553f60ecb6fcb080136dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611131116/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76b3a5fe2eb334968be07c9be2cc3c4275d0f1759e8f8bf1a59a5f3a70ea43a4"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/nightly-202611131116/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d75775872de543e93730112babd50bfa8478eaaacd1e041f2fa5e153078a300d"
    end
  end

  def install
    bin.install "atlas-code" => "atlas-code-nightly"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code-nightly --version")
  end
end
