class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.1/gitmate_0.1.1_darwin_arm64.tar.gz"
      sha256 "c138bbc999cd15f6f90187f99e27d794ff841959fb7dcd17f1125a66f5dd4d48"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.1/gitmate_0.1.1_darwin_amd64.tar.gz"
      sha256 "71a19aa5966cbb47f926e3ead9992460408af5e12161bffdd4e710f9b2a25877"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.1/gitmate_0.1.1_linux_arm64.tar.gz"
      sha256 "deafb0ce2fd3d0a0a9e25f185dd0b3a040340c4f3814d373d3792d8b17200b6d"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.1/gitmate_0.1.1_linux_amd64.tar.gz"
      sha256 "7de13c2782851f4de0eda7a85b202aad02ac1a1ffa8fc6d50b0b260618c3d85d"
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

      Try it:
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
