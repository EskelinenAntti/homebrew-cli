class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "54811d04767e861d2a74f4e12f4ecf0d683d76887ad51cf8247a735a19fbd803"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
