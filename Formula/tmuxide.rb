class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "4c176903e8f214558a1d573e015d68e525287621f49b02a242d217dba1620d32"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-3.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f2758094f726a369dededdb7d01ee050c5b914448c9279834e5d056dc8c0c96c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "74bcf4eefb0c99e7a13a07fac0b82573bdd47d2037f634ab4219b470c711a8d8"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/cs/"
    bin.install "cs"
  end
end
