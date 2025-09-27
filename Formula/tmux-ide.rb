class TmuxIde < Formula
  desc "Helix + lazygit + tmux = tmux-ide"
  homepage "https://github.com/eskelinenantti/tmux-ide"
  url "https://github.com/EskelinenAntti/tmux-ide/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "15a1081f7bf403bd86e0c499f9f13e45f0df1228a2091775bbf5fa634e5b70f1"
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
