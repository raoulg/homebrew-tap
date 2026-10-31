class AtlasCode < Formula
  desc "Atlas — your code's topology"
  homepage "https://atlas.pttrn.io/"
  license "AGPL-3.0-only"

  # `brew install --HEAD raoulg/tap/atlas-code` builds the nightly line, `next`, from source.
  head do
    url "https://github.com/raoulg/atlas.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.70.0/atlas-code-aarch64-apple-darwin.tar.gz"
      sha256 "0ddb84cd8c84537f9773528e58942b6e3d42d0ab8a621c423e0dd171455cf7ec"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.70.0/atlas-code-x86_64-apple-darwin.tar.gz"
      sha256 "50167a29a86d01e98dec89fc7894ef75c3e4a44f988f6ad22ad222b06b359e24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.70.0/atlas-code-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b69baeee647718e98b8ec2b7ff24fb2fe5e29b13e0b7b3695586960972a3ede1"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.70.0/atlas-code-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44f9e2c32f968b17ea328c948060f7b37047b5c79ebda896c979a9fc6dd03982"
    end
  end

  def install
    if build.head?
      ENV["ATLAS_CHANNEL"] = "nightly"
      system "cargo", "install", *std_cargo_args(path: "cli")
    else
      bin.install "atlas-code"
    end
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/atlas-code --version")
  end
end
