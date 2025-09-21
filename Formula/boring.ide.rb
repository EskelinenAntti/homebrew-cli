class BoringIde < Formula
  desc "Helix + lazygit + tmux = boring.ide"
  homepage "https://github.com/boringconfigs/boring.ide"
  url "https://github.com/boringconfigs/boring.ide/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "d7a55c921133d33e85c937028cdae433162d8f1136860cbfc00f0dcd4473ab3b"
  license ""

  depends_on "helix"
  depends_on "lazygit"
  depends_on "tmux"

  def install
    bin.install "bin/ide" => "ide"
  end

  test do
    assert_match "Usage: ide [path]", shell_output("#{bin}/ide --help")
  end
end
