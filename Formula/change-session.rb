class ChangeSession < Formula
  desc "Open or create tmux sessions at any directory "
  homepage "https://github.com/EskelinenAntti/change-session"
  url "https://github.com/EskelinenAntti/change-session/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "aee0cd22825154fef4d5cee2ef0cf366b75c81bb46c29383dcbf7c24d55dbe3a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/cs/"
    bin.install "cs"
  end
end
