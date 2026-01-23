class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.9.1.tar.gz"
  sha256 "201a6ac15865c734e1ce988d5465d8e6dbc038f9c1ad1c0366a7bf07a78b1492"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "55c8979d947d016d8b098dece08e84056d1ac7ee05cfd17210980647f6641afc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d8426e02986cc0d720ffe170955280c4e51da8adfb4bfc8385ace4702c7f91f3"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
