class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.1/gitmate_0.2.1_darwin_arm64.tar.gz"
      sha256 "d4cc6e3d1ea4d1d1884528a684a9da760bc42d7da19389074f9afeb6b9d1f2ea"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.1/gitmate_0.2.1_darwin_amd64.tar.gz"
      sha256 "1d212bb04640be896d2781287d41cd68d5f15685303e9b9d414648b4412f0fd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.1/gitmate_0.2.1_linux_arm64.tar.gz"
      sha256 "755f670ac3eeb2a66b0aed9715481393d28440f101dc4f44bca321dcad16847e"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.1/gitmate_0.2.1_linux_amd64.tar.gz"
      sha256 "6e6ca629c4335f90c0c69ba63345e7baa4b7225b4f66b87a7af629fb9d83f232"
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
