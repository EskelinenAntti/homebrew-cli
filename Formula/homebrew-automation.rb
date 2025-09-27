class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "646261f25c41ee15236cee93758eb4daa293afddc7dbe5865eb8dbd758cc277e"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
