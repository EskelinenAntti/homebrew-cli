class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "69dbb7d9e869ea550df755e617cbb48879240a7f42f27fa70db8ae275ca5ccd0"
  license ""

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/homebrew-automation-0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c53c113d0af2232877b4981882bc36b12f9ef5fe0f1539639634356448aa1ba8"
    sha256 cellar: :any_skip_relocation, sequoia:       "7fad0a2864c4cf8ccbd2c933a2108e3ad484c92b5336da4a49ea84fe1bddcfd2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cf1d38fdf3392f1657530b49b3b1b4d4b0464eb842bd8f1b2461d0281c44f194"
  end

  def install
    bin.install Dir["bin/*"]
  end
end
