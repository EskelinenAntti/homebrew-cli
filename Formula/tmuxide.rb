class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v7.0.1.tar.gz"
  sha256 "89318812a8ee4a950381877fce8a1ea2c831d478597d1836542342cdfd5b26fd"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-7.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e951572b2bdf75d4f26840744318a7300028bb3f8a858305a7b3613ccd9f093a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "da6f3d30b2a20b6fc84fbdfd5bf18748114a7637ec2000c51df3d9cb786899fa"
  end

  depends_on "go" => :build
  depends_on "fd"
  depends_on "fzf"
  depends_on "git"
  depends_on "tmux"

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
