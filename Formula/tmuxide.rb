class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v6.1.1.tar.gz"
  sha256 "9b77dc6d2476cc61528a8db78e82f2d31824cc97d617c7b1e621ddb8347a0836"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-6.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a1b3bc179f0aa5c87949b62c2dc4ebc419ed83d7f4f9a30b96f3749f7419ded3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "31b91a4dce56978259fcc354519ade8537f6d05bbecfb1d294188d24cfad1e5a"
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
