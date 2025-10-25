class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b6f5bdbf7389ea9bffbf78c8f72164eacdb29aea8f3132ae19ac894fecebd31c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/ide/"
    bin.install "ide"
  end

end
