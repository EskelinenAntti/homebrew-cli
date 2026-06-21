class ZshConfiguration < Formula
  desc "My personal zsh configuration"
  homepage "https://github.com/EskelinenAntti/zsh-configuration"
  url "https://github.com/EskelinenAntti/zsh-configuration/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "0ddd6d7b7a3307d08a3eadbb070cd7b3bda46bca4c7202e17e0e18eca92aa2f1"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/zsh-configuration-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4db16abf1a46fe4ee82fb7093a063b886bef1407a10ae6c5bd813608ce5c14eb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4fe43d6aaf9a925b0b82f391e9265b602d69b60896e1cebb9989e8d3296e3621"
  end

  depends_on "fzf"
  depends_on "zsh-autosuggestions"
  depends_on "zsh-syntax-highlighting"

  uses_from_macos "zsh" => :test

  def install
    pkgshare.install "zsh-configuration.zsh"
  end

  def caveats
    <<~EOS
      To activate the configuration, add the following at the beginning of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-configuration/zsh-configuration.zsh

      You will also need to restart your terminal for this change to take effect.
    EOS
  end

  test do
    assert_equal "100000",
      shell_output("zsh -c 'source #{pkgshare}/zsh-configuration.zsh && echo $HISTSIZE'").strip
  end
end
