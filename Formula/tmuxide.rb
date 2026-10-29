class Tmuxide < Formula
  desc "Tmux sessions for simple humans"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v9.0.0.tar.gz"
  sha256 "452872b375222906ed0b4e97d1152f9dad4620adc7852ca8e630afb328c6a648"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-8.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4b714441998542af29994f177687711bbc445658848263de0a5dadc1447f97da"
    sha256 cellar: :any,                 x86_64_linux: "6f2418840c276dec96b7311307328d9f8af286aa9caf8c3b17335854e0f27882"
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
