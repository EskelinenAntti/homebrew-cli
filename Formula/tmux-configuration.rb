class TmuxConfiguration < Formula
  desc "My personal tmux configuration"
  homepage "https://github.com/EskelinenAntti/tmux-configuration"
  url "https://github.com/EskelinenAntti/tmux-configuration/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "73d8567499c62a34623fe402508da2022bee97871233bc840bb8fb5f78aaa4ae"
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
