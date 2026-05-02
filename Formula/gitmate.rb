class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.0/gitmate_0.4.0_darwin_arm64.tar.gz"
      sha256 "bb497af25297240aa772d006427be8bfb52f0d6932453013512d712f33098bf0"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.0/gitmate_0.4.0_darwin_amd64.tar.gz"
      sha256 "ff2c3d19a50550b249e4f7989253861800fa99f00d65b6106473f6d6f304b5dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.0/gitmate_0.4.0_linux_arm64.tar.gz"
      sha256 "c5123df778471cb872e4718b82ef0a1633849350d7f6e072094411d336efba9b"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.4.0/gitmate_0.4.0_linux_amd64.tar.gz"
      sha256 "dc5054a5d7bc946f2893d9ac8d87f2a370680d5306320c3f3ba9c23ec81eed35"
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
