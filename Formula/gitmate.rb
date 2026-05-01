class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.9/gitmate_0.2.9_darwin_arm64.tar.gz"
      sha256 "3344ee2707a2b5ae1275f8d4bf385353c1de99645cc4f4e7ef2e94320f262b8d"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.9/gitmate_0.2.9_darwin_amd64.tar.gz"
      sha256 "9ffeec917ebd92d1b49aaf5ed96635101ce1a1f309957446dfdb368980d575bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.9/gitmate_0.2.9_linux_arm64.tar.gz"
      sha256 "c1ef5d8baae9a5b35b39f3ea6ce448f5aadbfd3fe6935835b618fd2c6c35c106"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.9/gitmate_0.2.9_linux_amd64.tar.gz"
      sha256 "f0ec566a63eccdceae771b0eb6b674c67fd238db1724e4818abadfc64fe844fb"
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
