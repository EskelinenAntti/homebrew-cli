class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "6ac504f53cf5ba31503210466a58947f8328d89fe76b6d833861e0b193cb2360"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
