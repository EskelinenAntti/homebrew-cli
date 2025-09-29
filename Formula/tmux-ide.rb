class TmuxIde < Formula
  desc "Helix + lazygit + tmux = tmux-ide"
  homepage "https://github.com/eskelinenantti/tmux-ide"
  url "https://github.com/EskelinenAntti/tmux-ide/archive/refs/tags/v0.0.13.tar.gz"
  sha256 "8e20d4c33da2297311f0c5bfac3bb401b2995f8ca14408ad699ade6c0a598d10"
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
