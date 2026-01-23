class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.9.0.tar.gz"
  sha256 "ecdfb3149baeea39dddadc5f0ca0363aad7e05b201159764735f1740e7085e8e"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cd58314661e75ca28a431bf41af61f179b38ed010039c439a474a284c3077e5c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4053594d97eaee511c93b79f590e31ad81235e2c00059137df6516e5094b3a10"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
