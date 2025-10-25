class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "61a9cb80a9b2a76c2d83ef65580714ba659aba48c48fc83200f373dd92dcc4a1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/ide/"
    bin.install "ide"
  end
end
