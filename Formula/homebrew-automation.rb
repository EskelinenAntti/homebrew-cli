class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f49dbbf08f26e5e87a72f560af964ab5cf66528456866aebbccf34f4b79da314"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
