class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.9.3.tar.gz"
  sha256 "69232868c1b2ce1c2d420ba2b87d1c63e727275f76c246883fe795ad63f57aa9"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.9.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5e9ae505fc7291580a7b654bfbc257f0f0674a37dbc6f78b2b726a5babb1b16d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f9c1e2cd7a7e38f6c3ea097e105710b4d2ed7d46f5f85bb920b58b0ca8ad1885"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
