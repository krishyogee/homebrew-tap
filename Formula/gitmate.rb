class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.7/gitmate_0.2.7_darwin_arm64.tar.gz"
      sha256 "bd7461d04d4eff367c9ff635d65b12d09fdf960110df61deffbb5cb55360e8fb"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.7/gitmate_0.2.7_darwin_amd64.tar.gz"
      sha256 "5b81e89e4a4cf36791e6aea082d0b926b5c55c28b3147136c691cd0271ab2c49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.7/gitmate_0.2.7_linux_arm64.tar.gz"
      sha256 "4648d4f46bf9bbf0744e768d2b314ccddab9444de11b86be127ac869f9cd66eb"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.7/gitmate_0.2.7_linux_amd64.tar.gz"
      sha256 "3b02e74a0aa4e1221c78fc1d07a5f7f6d0aca3d6379c3cf703ecc1dd294e23fa"
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
