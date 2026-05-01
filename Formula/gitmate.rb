class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.3/gitmate_0.2.3_darwin_arm64.tar.gz"
      sha256 "705f1052aad3021dc11d6135e7595d9333b5236318f3f1b78b5c7642fbd74fbc"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.3/gitmate_0.2.3_darwin_amd64.tar.gz"
      sha256 "823acaa61c8d44a6ed0c25ff4548d068b26839a4dfb547480f16047ce42ff871"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.3/gitmate_0.2.3_linux_arm64.tar.gz"
      sha256 "acba46b3d553633eb15a550b86ee94afb6f0752daeee049f25cdeb9ad38d4f39"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.3/gitmate_0.2.3_linux_amd64.tar.gz"
      sha256 "d2859569335ad09a25c9af2281d42d53d7ff54e4d93f221069d428972a62742b"
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
