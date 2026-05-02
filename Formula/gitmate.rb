class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.1/gitmate_0.4.1_darwin_arm64.tar.gz"
      sha256 "a88dbbb031315172d8f97f6307a5f7bebc4c1f4cea8806e3eb0c6978f98fd52a"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.1/gitmate_0.4.1_darwin_amd64.tar.gz"
      sha256 "b223693957b9c7b9b487aa66a54851075f467bb4a87a944d6fdbdedd3a4f3815"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.1/gitmate_0.4.1_linux_arm64.tar.gz"
      sha256 "d0b6448b16e7421c9d4efd1f46f799e8698c74da224a6e77335d5b16b73f6c3a"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.1/gitmate_0.4.1_linux_amd64.tar.gz"
      sha256 "cdf6704e0838e6ca5d7faf7c190e418215390138d721dcddfe94166b75cee71c"
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

      Friendly mode (AI-rephrased plain-English summaries):
        gitmate --friendly status
        gitmate config set output.friendly true

      Docs: https://github.com/krishyogee/gitmate
    EOS
  end

  test do
    assert_match "gitmate", shell_output("#{bin}/gitmate version")
  end
end
