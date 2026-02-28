class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v6.0.0.tar.gz"
  sha256 "0bd991d30cd88c5d1330e478ce8e7287ecf32e6a1112dc97da4b1da64dc412ed"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-6.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1c0d71a58a56f76780b20dad996de42935e6d185842e30eb0f252f55e2f558d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a63ffd850912d850700bc35d4a8367e07b6e52f9c6f9d663760e06f8504ad50b"
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
