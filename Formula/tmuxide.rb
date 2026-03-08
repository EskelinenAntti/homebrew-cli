class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v7.0.2.tar.gz"
  sha256 "7816139e12328b2ace27fe49cc9190a5c28e4ec3cc906cabbccb94c918adf985"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-7.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "63d058d4f5a581a78b327ae2e2c841931472afac3eb3e5b3e5ca70f793556c89"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6d032d20cbb1f3d92a2a16bc1de1db767af402a8cd570244ac444242aa7d70c8"
  end

  depends_on "go" => :build
  depends_on "fd"
  depends_on "fzf"
  depends_on "git"
  depends_on "tmux"

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
