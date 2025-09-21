class BoringIde < Formula
  desc "helix + lazygit + fzf + tmux = boring.ide"
  homepage "https://github.com/boringconfigs/boring.ide"
  url "https://github.com/boringconfigs/boring.ide/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "85772d34f12a7fe9b5264072b23388dc017cd2693513548948193ed765ab69fc"
  license ""

  depends_on "helix"
  depends_on "tmux"
  depends_on "lazygit"

  def install
    bin.install "bin/ide" => "ide"
  end

  # test do
  #  system "#{bin}/ide", "this_path_is_invalid"
  # end
end
