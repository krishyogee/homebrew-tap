class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.6/gitmate_0.2.6_darwin_arm64.tar.gz"
      sha256 "f4ebb84ef057eeff37a8d4a6a08669f01fcdd97e71e140abdc8ceadb9b249048"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.6/gitmate_0.2.6_darwin_amd64.tar.gz"
      sha256 "181e24432245a82c5f81bde6e1c79b2f0c2d217a3b7f970f47a50beba2ea3904"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.6/gitmate_0.2.6_linux_arm64.tar.gz"
      sha256 "64c0e266f4f03485a9678e2bac419a536e840dddff57a6ca8c50affca5eafbcf"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.2.6/gitmate_0.2.6_linux_amd64.tar.gz"
      sha256 "3443ae218f421c02503914f08aff98e56217576fcad17adb8228ff1634da9197"
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
