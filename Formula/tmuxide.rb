class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "8e30a1f6b882ef8360ab09d378826d5d65fd8c3855ca07c314069e65baf54de4"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-1.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "355e284cfb9fd4c4f3c27ccbd2b80ed7d10fe448dff65a5b80f4bbac929bc0e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cc9b92f0027a9e6920e31b5c2cc252a2d701b8524dfaee46ee52a43a4b8f2770"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/ide/"
    bin.install "ide"
  end
end
