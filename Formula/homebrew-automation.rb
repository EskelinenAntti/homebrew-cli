class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "0c7c1008f5074e5371effb9bb056242eee94d7e4668efb6e9aedb0ec2d940b5f"
  license ""

  def install
    bin.install Dir["bin/*"]
  end
end
