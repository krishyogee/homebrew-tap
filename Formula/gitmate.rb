class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.4/gitmate_0.2.4_darwin_arm64.tar.gz"
      sha256 "a696837fb52a23b4829bb0e6d8770625ee8aa9a9e2028687a0317f80b8d8cc59"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.4/gitmate_0.2.4_darwin_amd64.tar.gz"
      sha256 "171db16da4f1e107ee3b3c7082a1b8014147eec7b81818d7e0c0f6c56694cd33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.4/gitmate_0.2.4_linux_arm64.tar.gz"
      sha256 "1f2ea6850f0445ec027893d2fe6cda942bbca4a60d5bcf6d7f63b6373617b261"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.4/gitmate_0.2.4_linux_amd64.tar.gz"
      sha256 "aafeb234c1bfa80318b93b0f3edbff52bb645c8a4b8aeae7efa56b40436185e2"
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
