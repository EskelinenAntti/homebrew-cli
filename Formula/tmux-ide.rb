class TmuxIde < Formula
  desc "Helix + lazygit + tmux = tmux-ide"
  homepage "https://github.com/eskelinenantti/tmux-ide"
  url "https://github.com/EskelinenAntti/tmux-ide/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "95ae4a6ceb3edcf81568fdfea446cf6dc053a9ae3e5b8af37fe1578327f5968d"
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
