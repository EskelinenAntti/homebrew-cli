class TmuxIde < Formula
  desc "Helix + lazygit + tmux = tmux-ide"
  homepage "https://github.com/eskelinenantti/tmux-ide"
  url "https://github.com/eskelinenantti/tmux-ide/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "06115943e7cae0bd259a0b9527b0c12b4054fe8474d97f970d0dfb3d96bee39f"
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
