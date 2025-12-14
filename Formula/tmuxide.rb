class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "85d43b2a9bde0883ef4f9368482d82ba1a35536e16d9d0b4734c2a7a2d1f4c70"
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
