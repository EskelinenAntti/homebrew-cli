class TmuxConfiguration < Formula
  desc "My personal tmux configuration"
  homepage "https://github.com/EskelinenAntti/tmux-configuration"
  url "https://github.com/EskelinenAntti/tmux-configuration/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "944c534908f45063add71322ad5f75c4411fe1e5950b8c81d9aa4a2d573547e1"
  license "MIT"

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
