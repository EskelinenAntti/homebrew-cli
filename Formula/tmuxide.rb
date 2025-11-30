class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "f39f37152071f48fde2761d0d9c2061b4275ce7cf2695a2651e8e95242ba3d3b"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7c2fbee64057fdaf6b3480a4b5efc38e63188d1843b3e375904e8131d891c21e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "317c53706a3f533d337512e15f512529ab6cf8a0ba24cdbcebc3c48677c636d8"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/ide/"
    bin.install "ide"
  end
end
