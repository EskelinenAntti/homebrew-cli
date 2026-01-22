class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.8.2.tar.gz"
  sha256 "7fca4b448842661171a519cc8d7460f6b29fd3f8c65a1fe011a44b7d0dea44c8"
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
