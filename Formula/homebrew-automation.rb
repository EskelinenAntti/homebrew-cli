class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "64ab83e5126d37b5b50d193ff4ad30c464a64898fb7236db48d66b5c25be6bcf"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
