class TmuxConfiguration < Formula
  desc "My personal tmux configuration"
  homepage "https://github.com/EskelinenAntti/tmux-configuration"
  url "https://github.com/EskelinenAntti/tmux-configuration/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "9a5dbe9c089f25175869b612565a51babfec56af4d0675034def35095d39add3"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmux-configuration-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f6c5f8cbc7e164f47a85689e6e98c5dfeba619b8e0cf261bb714d8f21001e025"
    sha256 cellar: :any_skip_relocation, sequoia:      "da12d6ddfdb6f9dece433fde5c828a796fd6b020d68dae239136a4ddd23d5924"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b316760cf57f0bb442864dfa19597b3bc78691415105181391b2ae2f11f87d35"
  end

  def install
    pkgshare.install "tmux-configuration.conf"
  end

  def caveats
    <<~EOS
      To activate the configuration, source it from your tmux config by adding
      the following to your ~/.tmux.conf:

        source-file #{HOMEBREW_PREFIX}/share/tmux-configuration/tmux-configuration.conf

      You will also need to reload your tmux config or restart tmux for this
      change to take effect.
    EOS
  end

  test do
    assert_path_exists pkgshare/"tmux-configuration.conf"
  end
end
