class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "4c176903e8f214558a1d573e015d68e525287621f49b02a242d217dba1620d32"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8bb440f169e3b45a74cb2b94b2f2a1da824c60b72e91d90ef1c5e0d93ee57fb2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e9c6894aaa3450da31f26ba5905a4fc40438fc5b688aad32e210492b08649ebc"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/cs/"
    bin.install "cs"
  end
end
