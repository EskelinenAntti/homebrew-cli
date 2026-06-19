class ZshConfiguration < Formula
  desc "My personal zsh configuration"
  homepage "https://github.com/EskelinenAntti/zsh-configuration"
  url "https://github.com/EskelinenAntti/zsh-configuration/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88cbf9b4dfe03ed10517b485e379435d2b20dc95a9bc215afef133426612c2e6"
  license "MIT"

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
