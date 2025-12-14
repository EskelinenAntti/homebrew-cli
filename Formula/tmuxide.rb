class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "85d43b2a9bde0883ef4f9368482d82ba1a35536e16d9d0b4734c2a7a2d1f4c70"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-4.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "51939fc8e607993caa1acfb81b27ae8ca8e7c3de5fe7cd2c1f62263ed36d95d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0be84ad006536656435b0bbd3b68b07afd4cd126918d4cc90f3ad930e230bd6d"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/cs/"
    bin.install "cs"
  end
end
