class Gitmate < Formula
  desc "Multi-agent AI CLI for Git workflows with approval gates"
  homepage "https://github.com/krishyogee/gitmate"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.2/gitmate_0.1.2_darwin_arm64.tar.gz"
      sha256 "9290b7f980f59a8f7f4ec0151b7bc38196ec823cfcbd84a97e012d0defc4b56d"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.2/gitmate_0.1.2_darwin_amd64.tar.gz"
      sha256 "f008d05871b34c24ec558fadcb81e8299a53dc7bb05d1d9f21287546a7b30490"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.2/gitmate_0.1.2_linux_arm64.tar.gz"
      sha256 "9f86b75769a345bbe037f7b3132c07703be9ba786727bd4cf3c8013dbc8e9c8e"
    end
    on_intel do
      url "https://github.com/krishyogee/gitmate/releases/download/v0.1.2/gitmate_0.1.2_linux_amd64.tar.gz"
      sha256 "bcbf602f64217643671e8232018868de95a3b240614e61c64944fe5530ca8b61"
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

      Try it:
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
