class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions."
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "f445507b383556fd40897048bbbd3d6ea505aa14d0863eae5d96f7f995dac589"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
