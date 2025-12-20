class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.4.1.tar.gz"
  sha256 "ef1cb07f121582227eef45807c9aedc6df900e6aa194f4a5cba3f46b085afb2b"
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
