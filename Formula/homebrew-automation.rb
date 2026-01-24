class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "54811d04767e861d2a74f4e12f4ecf0d683d76887ad51cf8247a735a19fbd803"
  license ""

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/homebrew-automation-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "39cc3bfa7718b0ab5d4840f98d4d5bf08bd24ee8580e65cefcabf24c1db44063"
    sha256 cellar: :any_skip_relocation, sequoia:       "580051de66b1647db9dd086596639915ebafe0e0410e6df4c1a47b72d1c8e746"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "902cd3c2b02ab4dff21e15ad2469c9a595844fdb2f7f4381d2a0d0773aab1032"
  end

  def install
    bin.install Dir["bin/*"]
  end
end
