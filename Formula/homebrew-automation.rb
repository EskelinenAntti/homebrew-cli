class HomebrewAutomation < Formula
  desc "Handy scripts for automating Homebrew related actions"
  homepage "https://github.com/EskelinenAntti/homebrew-automation"
  url "https://github.com/EskelinenAntti/homebrew-automation/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "cf6b6e468a912494460b8c2a31927be01ddc44a2bf09cfd5244952ac93640d8d"
  license ""

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/homebrew-automation-0.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "26dc8156369c208547b95aa2c7baabd788049fba2426214f1938b65c2157478d"
    sha256 cellar: :any_skip_relocation, sequoia:       "1417ca5c02c7a849993b40bdc5bf82c3f597648437c4af24afd59c4eeaa0d4c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "28869d795c4252004f43d2f0454916e539b87bcb98532ef3e6dac5bddd9801f0"
  end

  def install
    bin.install Dir["bin/*"]
  end
end
