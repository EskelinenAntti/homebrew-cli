class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "103f9f2629d38a323fd3ef0e879879d3413c03ce25e5446e2b86773dbf497150"
  license ""

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/homebrew-automation-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bc58834726e4086cf1362a3cb3bd8805c64b8340e2f080da6d72161b8df4994c"
    sha256 cellar: :any_skip_relocation, sequoia:       "474c63021e3590e0c6223c37c1c586b2606a7760d4b38ae0daa5bc0d15f10ced"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "78f51bed46e8ffec02cbe6f490303848b429a98e18c23fdbd93be5dbd0bb4d4e"
  end

  def install
    bin.install Dir["bin/*"]
  end
end
