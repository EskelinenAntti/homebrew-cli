class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v7.0.2.tar.gz"
  sha256 "7816139e12328b2ace27fe49cc9190a5c28e4ec3cc906cabbccb94c918adf985"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-7.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fe337cc095773d6045b5ad952e8590d026917e23d07e1f0f0de9e9b6d41a8b90"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "681f0749a6731e0051530692d15b11398c3c38b725a42859ce047c3c9e0f8b8f"
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
