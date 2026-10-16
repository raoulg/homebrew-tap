class Atlas < Formula
  desc "Draws what a program is, beneath the language it is written in"
  homepage "https://raoulg.github.io/atlas/"
  version "0.66.1"
  license "CC-BY-NC-SA-4.0"

  on_macos do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.1/atlas-aarch64-apple-darwin.tar.gz"
      sha256 "e281800ae133b84e5c5e66f72656bdbcc0f356ccae5ed26528f2057c22e23192"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.1/atlas-x86_64-apple-darwin.tar.gz"
      sha256 "04b55ca97fb62c9d60ce761e62fa9657d608022a3cba29a66f43032933ad09d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.1/atlas-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad161c8a16a1675f98f379de25b63fd3f8d11e706e2abbe872080fff7d2de38a"
    end
    on_intel do
      url "https://github.com/raoulg/atlas/releases/download/v0.66.1/atlas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cbd12ce34f6206db479633c69cbfbe01cd53cd37fae2896ed6b53f3e883f362"
    end
  end

  # `brew install --HEAD raoulg/tap/atlas` builds the nightly line, `next`, from source.
  head "https://github.com/raoulg/atlas.git", branch: "next" do
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
