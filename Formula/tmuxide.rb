class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e9f2a82ebe32506c12562a54ce12f41e6fec6624cadb8f839777bc5a83cf32b5"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-1.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "08a83a6170bc5c6c871d336bf8382e40d6d9fc30b3468fd89a377e20356bb6c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7d0ee7a4af1d5eaf8ed5a1225f109e767c3212d85b5bb891d9915fb18182075d"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/ide/"
    bin.install "ide"
  end
end
