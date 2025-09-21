class BoringIde < Formula
  desc "Helix + lazygit + tmux = boring.ide"
  homepage "https://github.com/boringconfigs/boring.ide"
  url "https://api.github.com/repos/boringconfigs/boring.ide/tarball/v0.0.3"
  sha256 "8c304db593e30915af3b6c5a133a05b72b4a3ca67dc040ea31adae102e770bb1"
  license ""

  depends_on "helix"
  depends_on "lazygit"
  depends_on "tmux"

  def install
    bin.install "bin/ide" => "ide"
  end

  test do
    assert_match "Usage: $(basename $0) [path]\n\nArguments\n    path (optional) - Path to project root directory.\n\n", shell_output("#{bin}/ide --help")
  end
end
