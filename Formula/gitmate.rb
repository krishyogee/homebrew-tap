class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.0/gitmate_0.2.0_darwin_arm64.tar.gz"
      sha256 "6f393b2ba96758c669417731bce541cffe01ee527b6c334e09bba7a1a64da8b8"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.0/gitmate_0.2.0_darwin_amd64.tar.gz"
      sha256 "579a84695828a5a7c81c7cff4082704e3a69e0a848b030279f833d5421bb9022"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.0/gitmate_0.2.0_linux_arm64.tar.gz"
      sha256 "6cb3bf59872ec683ad6b2a1e00773920e59616215c664980188afb2a4eee8d67"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.0/gitmate_0.2.0_linux_amd64.tar.gz"
      sha256 "3e922e2a0cd5bd84f0fb70a9d56597f62837358fa352e28dccb92aa7afa55285"
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
