class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.8/gitmate_0.2.8_darwin_arm64.tar.gz"
      sha256 "a7615203681b595b2af8464fbfbe17beb44efdc474137d3a928587c8a9a550d0"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.8/gitmate_0.2.8_darwin_amd64.tar.gz"
      sha256 "74be6e73312e59b7e24f4c83a91dd45cdf56f5f03201e4b8351927c4f4beddbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.8/gitmate_0.2.8_linux_arm64.tar.gz"
      sha256 "63c1c3fadaa5377aa1dcf5929830a6f5d6a30da9f2410cef1751d1bbea5a5346"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.8/gitmate_0.2.8_linux_amd64.tar.gz"
      sha256 "3d51c1227121b4f64ad946821aa04310e18fdc6e659af950a36c4da3c6feb5ea"
    end
  end

  def install
    bin.install "gitmate"
  end

  def caveats
    <<~EOS
      gitmate needs an AI provider API key.

      Quickest start — interactive setup:
        gitmate init

      Or export a key directly in your shell rc:
        export ANTHROPIC_API_KEY=sk-ant-...   # primary
        export OPENAI_API_KEY=sk-...          # or
        export GROQ_API_KEY=gsk_...           # or

      Try the TUI dashboard:
        gitmate

      Or run a command directly:
        cd <some-git-repo>
        git add .
        gitmate ship --no-pr

      Docs: https://github.com/krishyogee/gitmate
    EOS
  end

  test do
    assert_match "gitmate", shell_output("#{bin}/gitmate version")
  end
end
