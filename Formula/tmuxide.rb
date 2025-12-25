class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.6.3.tar.gz"
  sha256 "a680b96e5349bddba3c2c43f788914a696d06139d1bebd3a10d209f47bc6f532"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bde0992abcd92b6e660da92d5a9b165baa9bba269c9ff1121a6ab3d5ef0616e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5b4a0d64c3087986614b07b94465163891e6ff41f6e0e84fcbcc4efb38d995fc"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
