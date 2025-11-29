class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "169fafbb525b1739dd375f43000e87aa859c961956f314ad6d900bbc00a518f1"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
