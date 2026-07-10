class ZshConfiguration < Formula
  desc "My personal zsh configuration"
  homepage "https://github.com/EskelinenAntti/zsh-configuration"
  url "https://github.com/EskelinenAntti/zsh-configuration/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "bac7500b873085adf28f542361d4e4699de4d7df383b4716edb84a2d9b18646d"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/zsh-configuration-1.0.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4c4ea8db0fc6bfa9be59ced98253e43e2e1058d1898c199d83a6182a242932c1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "efaa4d6b417b6d83761663173500e038b5a3d1ce51e034fd61120cf6063e70cf"
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
