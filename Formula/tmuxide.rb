class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.6.0.tar.gz"
  sha256 "553c2be6faad8d8d1342e166ae596e1b9b0757de093ec13edbc03f0d3c9e9077"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bde0992abcd92b6e660da92d5a9b165baa9bba269c9ff1121a6ab3d5ef0616e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5b4a0d64c3087986614b07b94465163891e6ff41f6e0e84fcbcc4efb38d995fc"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"
  end
end
