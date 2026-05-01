class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.5/gitmate_0.2.5_darwin_arm64.tar.gz"
      sha256 "04dbbb1ee978de7018dbcb9e78e1e6bb91d60da41fdb9291208fdf8819ae9e00"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.5/gitmate_0.2.5_darwin_amd64.tar.gz"
      sha256 "76401f26e48ad70caf1ff54d887e9f29e457c94a512133470c1adf136ccfad32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.5/gitmate_0.2.5_linux_arm64.tar.gz"
      sha256 "2568b343de03a3a35d1061b9f44c97576e037abff63cc20709a0e0b78c95356e"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.5/gitmate_0.2.5_linux_amd64.tar.gz"
      sha256 "e9f96932690934b08c0038638efa02db9967ba54e3d4b3cf5eb6df412ef4a34d"
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
