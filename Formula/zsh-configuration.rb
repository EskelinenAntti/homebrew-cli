class ZshConfiguration < Formula
  desc "My personal zsh configuration"
  homepage "https://github.com/EskelinenAntti/zsh-configuration"
  url "https://github.com/EskelinenAntti/zsh-configuration/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "4013688c9d4e9feebbad6c2d21e6061369e048237b4cb7bce1ce64c206d7e45d"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/zsh-configuration-1.0.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "222c25968c157ecfc421b2baa780a1572a072f5739c4300fe181ee995687a20e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9d2b42289188dcc2791665a66c07f17797e394c6d68aecbb2774ecc3fdeae78b"
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
