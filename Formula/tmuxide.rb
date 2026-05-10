class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v8.0.0.tar.gz"
  sha256 "628f669265c658745049b7e46f57c6513548a67e6c931ca620bcc96447face61"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-8.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3a23b7d8c947448b6dcaae305aff04eeb55f4e6f6e54db3cbfc5d22ad8fd598e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cd967484d1bbf3a39d40f0df9dfa964514fc6b1957ecd65b2b4a917b8bb56940"
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
end
