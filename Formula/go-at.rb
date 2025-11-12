class GoAt < Formula
  desc "Open or create tmux sessions at any directory"
  homepage "https://github.com/EskelinenAntti/go-at"
  url "https://github.com/EskelinenAntti/go-at/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "7c7c69607a9a0636dd69752747fe3b919f9e49b1c5f77cb49c11c8d8572acf28"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/go-at-0.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b44606bd45f4007ee9cc9fdee584e20874a7c586db10e3246a85c587bfe550ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7909f4e5a5ce42dcca5aa0fa27daa152fdfd408a35944d6c6119a2c5e23fbb3d"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/at/"
    bin.install "at"
  end
end
