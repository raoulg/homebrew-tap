class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.67.2"
  license "CC-BY-NC-SA-4.0"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.2/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "7510b80eb01ec6a19c587a1a81a99263cbad21c49fefcf29f05bcb1dd262c78b"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.2/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "73c670eb59893521f5025bb73449f8e97f48eeea657b3c8d16f586c475caf7eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.2/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98ac97cfb98652ef14716741d64c8abdea1835777d314d05ce14c06eb4a7c59c"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.67.2/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d58837754365fb73cfd8eb3bf5e1d74fe94245f61426da1cbfac0d21218ca37f"
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
