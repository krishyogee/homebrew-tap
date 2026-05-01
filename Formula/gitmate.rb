class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.2/gitmate_0.2.2_darwin_arm64.tar.gz"
      sha256 "07b0b6fb7e6a32d92644036d3c75d34e581988768715e3aa57f20ae8214a4f86"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.2/gitmate_0.2.2_darwin_amd64.tar.gz"
      sha256 "c1d11b0b4ff30f84cd18e7dafeb8ebe3eeb1dff3af8211a216811111ad5b51e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.2/gitmate_0.2.2_linux_arm64.tar.gz"
      sha256 "f17b7e324e60816adfe1ce132628c6977f83e88c93dbe1dce794f9f4d398598f"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.2/gitmate_0.2.2_linux_amd64.tar.gz"
      sha256 "391167b2087d84f4ce3dbb7a99246712a8f5faa192ac5d25b5536fa660b9f446"
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
