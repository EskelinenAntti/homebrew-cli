class TmuxConfiguration < Formula
  desc "My personal tmux configuration"
  homepage "https://github.com/EskelinenAntti/tmux-configuration"
  url "https://github.com/EskelinenAntti/tmux-configuration/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "9a5dbe9c089f25175869b612565a51babfec56af4d0675034def35095d39add3"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmux-configuration-1.0.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4b2cb78331635dd6ad8c91da80f92d9eb5782eedbe19434019d281fa9afbbb3e"
    sha256 cellar: :any_skip_relocation, sequoia:      "179d90b38d55c471eda77336ac7a4f8a9fb714b67425cfb2bcdf92ac989841f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d2600eacccc45e303c7c57a241dc46f57754a1fe7b207fbbe29de704b58bb77e"
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
