class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.6.0.tar.gz"
  sha256 "553c2be6faad8d8d1342e166ae596e1b9b0757de093ec13edbc03f0d3c9e9077"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "929b153c30af351dd2ed04112d732cb95f73cb78841fc16454a12026f3e33dd1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b71d2676721d95f6d729bf200f875de67babfa64565117005e7d4107e038f721"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"
  end
end
