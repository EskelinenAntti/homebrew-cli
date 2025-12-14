class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "f2a79b03a806114aaaf5f693ee8cc040efdecfdcd2be4d10aee87f41d3e231b2"
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
