class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v8.1.0.tar.gz"
  sha256 "9fab33fbb4ddbe881d9191a20f9d4053dd08a02336e6315e7192e46d17114f7c"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-8.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a7016ae25311d06da3c165aae68877d5e26a29e038267988a920e3247ce67a04"
    sha256 cellar: :any,                 x86_64_linux: "356a5948261fafd243a600544c41e4a2eceb6a29d723e881f86f5abe6530e9af"
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
