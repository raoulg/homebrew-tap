class AtlasCode < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.69.4"
  license "AGPL-3.0-only"

  # Ariga's Atlas, a database schema tool in homebrew-core, installs an executable of the same name.
  conflicts_with "atlas", because: "both install an `atlas` executable"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.4/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "bfb75daf5ee96436904968480f19e22bf9661fb56e4569a3ab7c33f50483b140"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.4/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "3a5821218a19269b93330601428fe2a0b147e769261fb7a3fe8d6856fe8d2b1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.4/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "247813a7c28aadc01c9f7f880ba354d15e999d39ea4f98105e99116dc5836b88"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.69.4/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5af5ff8c0761776e6093efe5e472384f74bcb34ef6c41569193e14d4aaa473cf"
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
