class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.6.3.tar.gz"
  sha256 "a680b96e5349bddba3c2c43f788914a696d06139d1bebd3a10d209f47bc6f532"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.6.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c6879786927e4762bb6b0ebde5800e2e70e539ff1b8d377f419bffd27b9642d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7e81ed7edd494e6de15f741febf99b74d75254d665b965aa547cb346f0b44208"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
