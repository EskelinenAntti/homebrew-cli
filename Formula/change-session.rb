class ChangeSession < Formula
  desc "Open or create tmux sessions at any directory"
  homepage "https://github.com/EskelinenAntti/change-session"
  url "https://github.com/EskelinenAntti/change-session/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "aee0cd22825154fef4d5cee2ef0cf366b75c81bb46c29383dcbf7c24d55dbe3a"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/change-session-0.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "32594ce26f215feb4f8e6a4191dd74e69d25ab80b757d7bb3c9cdfa35ee0b059"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "776331cf39392dbf680b664786f2e102516e659949ef147c490261d4e212331c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "./cmd/cs/"
    bin.install "cs"
  end
end
