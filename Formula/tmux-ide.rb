class TmuxIde < Formula
  desc "Helix + lazygit + tmux = tmux-ide"
  homepage "https://github.com/eskelinenantti/tmux-ide"
  url "https://github.com/EskelinenAntti/tmux-ide/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "7e87c769cbe2da867b9d3fc91c8ec9d725c9229672d6fe1e5679466b86d1902a"
  license ""

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
