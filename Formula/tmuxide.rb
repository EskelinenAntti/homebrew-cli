class Tmuxide < Formula
  desc "Tmux sessions for simple humans"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v8.2.2.tar.gz"
  sha256 "e90ed098cd42055c2d7491eae87c449ba48ac69fe0f632ad6e7e6351614ecb99"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-8.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "62b8f1535336b489320d28cbd32a426b54128c9d2a3bb1ff9e893bc535983bf6"
    sha256 cellar: :any,                 x86_64_linux: "62df5ffa22318236494cfff5371d10bda91fc75138d0117f1e0839b92a69ed03"
  end

  depends_on "go" => :build
  depends_on "fd"
  depends_on "fzf"
  depends_on "git"
  depends_on "tmux"

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end

  test do
    assert_match "tmuxide creates or switches to tmux sessions", shell_output("#{bin}/ide --help")
  end
end
