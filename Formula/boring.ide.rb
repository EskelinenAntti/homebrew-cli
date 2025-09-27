class BoringIde < Formula
  desc "Helix + lazygit + tmux = boring.ide"
  homepage "https://github.com/boringconfigs/boring.ide"
  url "https://github.com/boringconfigs/boring.ide/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "16752bb9893503aaa1298c02b1c13f5640894d10a4b7cd0f2580eacd51f5db48"
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
