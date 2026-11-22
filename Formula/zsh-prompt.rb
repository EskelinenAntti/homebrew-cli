class ZshPrompt < Formula
  desc "Git-aware Zsh prompt with Vim editing and prefix-history bindings"
  homepage "https://github.com/EskelinenAntti/zsh-prompt"
  url "https://github.com/EskelinenAntti/zsh-prompt/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "976766a27e6cf4eaa82db84ba3926abab42a393353be2056581eebf832e54cd7"
  license "MIT"

  uses_from_macos "zsh" => :test

  def install
    pkgshare.install "zsh-prompt.zsh"
  end

  def caveats
    <<~EOS
      To activate the prompt, add the following to your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-prompt/zsh-prompt.zsh

      You will also need to restart your terminal for this change to take effect.
    EOS
  end

  test do
    assert_equal "1",
      shell_output("zsh -c 'source #{pkgshare}/zsh-prompt.zsh && echo $KEYTIMEOUT'").strip
  end
end
