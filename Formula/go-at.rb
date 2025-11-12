class GoAt < Formula
  desc "Open or create tmux sessions at any directory"
  homepage "https://github.com/EskelinenAntti/go-at"
  url "https://github.com/EskelinenAntti/go-at/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "7c7c69607a9a0636dd69752747fe3b919f9e49b1c5f77cb49c11c8d8572acf28"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/at/"
    bin.install "at"
  end
end
