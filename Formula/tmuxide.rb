class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v6.1.1.tar.gz"
  sha256 "9b77dc6d2476cc61528a8db78e82f2d31824cc97d617c7b1e621ddb8347a0836"
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
