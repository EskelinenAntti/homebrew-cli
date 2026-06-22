class TmuxConfiguration < Formula
  desc "My personal tmux configuration"
  homepage "https://github.com/EskelinenAntti/tmux-configuration"
  url "https://github.com/EskelinenAntti/tmux-configuration/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "e6797be20cf5ca416ee1c03b740fe11bbacf1a7e54f14a618219c8d2f984e987"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmux-configuration-1.0.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f07caaec99325e4d77082af781dd6b90503045c70b25b7232b16b6379f9d6e2b"
    sha256 cellar: :any_skip_relocation, sequoia:      "d3221a44c439d71f768742d17f7fb0891531f3a1d850c3ae215ab1aac0dbbc48"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "34e63d0105d569c498a547e7cacc3d85c57c7dfbfe911c76e29e33579c2cc878"
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
