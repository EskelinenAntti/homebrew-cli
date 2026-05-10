class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "cf6b6e468a912494460b8c2a31927be01ddc44a2bf09cfd5244952ac93640d8d"
  license ""

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/homebrew-automation-0.3.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1aadb697aa2ff88fd3681a03b667e87b509fdfbf1cfb7f355097b463bea86455"
    sha256 cellar: :any_skip_relocation, sequoia:       "0661381b46991b989906a1346c37aa06cc703c7effffe419cf5efd407e8ef2c6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "439d2e5fd556f746d3ac483ea7cc0be71a3b6d81dfb0727812f06ef8d1438586"
  end

  def install
    bin.install Dir["bin/*"]
  end
end
