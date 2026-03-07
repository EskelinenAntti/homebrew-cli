class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "4475c971fa9fce8c5b9a91e54ced77c8648c1c40937ad974887b936e5e4eb0fb"
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
