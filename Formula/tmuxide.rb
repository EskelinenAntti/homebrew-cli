class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.4.1.tar.gz"
  sha256 "ef1cb07f121582227eef45807c9aedc6df900e6aa194f4a5cba3f46b085afb2b"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7d8b3fb0a00dbccf65e80b1f23903be15649d442cb75f67a72c4797a61308e4b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a4be5e4bc0e12980888f0849c2822ac169e5039ba30ae888eddf51724216e352"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"
  end
end
