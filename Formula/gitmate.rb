class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.2/gitmate_0.4.2_darwin_arm64.tar.gz"
      sha256 "e0a7e61311c5bd876576612981b417f6703cab9d603a324aa1cde6fda877dfab"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.2/gitmate_0.4.2_darwin_amd64.tar.gz"
      sha256 "bdbfbed9a5704a8cfd71f9aa4a63e1ed8902157da4088151b94008a30ecded13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.2/gitmate_0.4.2_linux_arm64.tar.gz"
      sha256 "c7fa807be9182a3ee9929efff6e8ebb548cb272ac35138e593f18c6900e9e0c7"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.2/gitmate_0.4.2_linux_amd64.tar.gz"
      sha256 "ea2a3b8f8433030c2e256d80263e089a452f09f755a9f09d2e7d591ff30446ae"
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
