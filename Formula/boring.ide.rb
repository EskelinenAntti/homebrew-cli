class BoringIde < Formula
  desc "Helix + lazygit + tmux = boring.ide"
  homepage "https://github.com/boringconfigs/boring.ide"
  url "https://github.com/boringconfigs/boring.ide/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "84cd154a789bce45ef950804ad38fe3191479122783f25e96743a34eaa4a97c4"
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
