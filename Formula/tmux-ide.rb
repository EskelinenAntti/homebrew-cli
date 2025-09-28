class TmuxIde < Formula
  desc "Helix + lazygit + tmux = tmux-ide"
  homepage "https://github.com/eskelinenantti/tmux-ide"
  url "https://github.com/EskelinenAntti/tmux-ide/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "744f40cb9bb144de6391bd316c34dde2cbde36185f818532ce27c923350ad78e"
  license ""

  depends_on "helix"
  depends_on "lazygit"
  depends_on "tmux"

  def install
    bin.install "bin/ide" => "ide"
  end

  test do
    assert_match <<~EOS, shell_output("#{bin}/ide --help")
      Usage: ide [path]

      Arguments
          path (optional) - Path to project root directory.

    EOS
  end
end
