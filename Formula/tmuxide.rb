class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "8e30a1f6b882ef8360ab09d378826d5d65fd8c3855ca07c314069e65baf54de4"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "180ba50664eb5e9bcc4ad7eca49609628d5fdd020e5107d25c93bf793a295f43"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6d3941ffa1c732ee62360b523d0c6d6c5d59961251b865af8178e31877d39185"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/ide/"
    bin.install "ide"
  end
end
