class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "61a9cb80a9b2a76c2d83ef65580714ba659aba48c48fc83200f373dd92dcc4a1"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "497a058d4ab6b501aec83417a78521ce890e066e97a2d0ee71696e6166d8ce7b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "51608623149ad3c79056a26d7c491df288b33a6a5d52ac4fd4af90a0bfa70477"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/ide/"
    bin.install "ide"
  end
end
