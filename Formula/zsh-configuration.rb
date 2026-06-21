class ZshConfiguration < Formula
  desc "My personal zsh configuration"
  homepage "https://github.com/EskelinenAntti/zsh-configuration"
  url "https://github.com/EskelinenAntti/zsh-configuration/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "fca85f50159421a26c0654cdf9d62a83d790855826285b207a473988de0cba4e"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/zsh-configuration-1.0.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f2c42d2e366a524d99cc4e21382320e54f70db2ee3d0ff55c8e35459ae2e566b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ffd1fd57272b055031ef758447db135f97db784e8fbbae961ce195490bcbef1f"
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
