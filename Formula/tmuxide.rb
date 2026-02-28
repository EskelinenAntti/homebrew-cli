class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v6.0.0.tar.gz"
  sha256 "0bd991d30cd88c5d1330e478ce8e7287ecf32e6a1112dc97da4b1da64dc412ed"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.9.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c859a49d38285c906f14dc3ae6d196cda7c1ed1896474fa0588808ab6e7b01e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "398b5917e998eccb41fb751fe4827e9572a6bbf6142a14afd5d7e0c15c274a5f"
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
