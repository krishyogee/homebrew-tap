class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.0/gitmate_0.1.0_darwin_arm64.tar.gz"
      sha256 "6df3038c9aedcd6bf5a0e2d5eb434c43922a48783adf2e138fe6ddf39a28f336"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.0/gitmate_0.1.0_darwin_amd64.tar.gz"
      sha256 "97fb428311b3dc6b27be7af7b3ef87cb48c3f1517cd85bb381d27110dceebc8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.0/gitmate_0.1.0_linux_arm64.tar.gz"
      sha256 "a8758071e63fa87fda14e5e6e2d70133c26bb2e8655bcaa2cc99024d48e51eba"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.0/gitmate_0.1.0_linux_amd64.tar.gz"
      sha256 "bdd832aa6fab1df81fb1eda98954cbeaab13ce929b6bad7417f2efa13102ac8d"
    end
  end

  def install
    bin.install "gitmate"
  end

  test do
    assert_match "gitmate", shell_output("#{bin}/gitmate version")
  end
end
