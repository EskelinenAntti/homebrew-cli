class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v6.1.0.tar.gz"
  sha256 "d28cc93e0da095d1b168d8cca47cf7e5402973fac84affbb0d42e82fcb8e31d2"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-6.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "21fc4877f58b6bad9b2b3a5d59130ecb5526ddce9c2493b366ff443131350ebc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "381850689560cae4fd59118a54d9a2a5e406aa37f64d35ee0a5a131512630100"
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
