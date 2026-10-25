class Tmuxide < Formula
  desc "Tmux sessions for simple humans"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v8.2.1.tar.gz"
  sha256 "0efc8a456524144de8a86e486ea2b86fbd1f2950c9f3890e0403b20e72bde851"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-8.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "38a86e730308d03a61ba92faf3603d4930af775b15842d25ed5ffcfc96d571a8"
    sha256 cellar: :any,                 x86_64_linux: "f8752d9efeec64e19e6232b1e06c83240b07162c981887387a3758cbfcfdaa06"
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
