class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v8.1.0.tar.gz"
  sha256 "9fab33fbb4ddbe881d9191a20f9d4053dd08a02336e6315e7192e46d17114f7c"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-8.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3a23b7d8c947448b6dcaae305aff04eeb55f4e6f6e54db3cbfc5d22ad8fd598e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cd967484d1bbf3a39d40f0df9dfa964514fc6b1957ecd65b2b4a917b8bb56940"
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
