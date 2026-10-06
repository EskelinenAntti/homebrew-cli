class ReviewMySlop < Formula
  desc "Keyboard-driven diff viewer TUI for reviewing AI code"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "cb9d8d5aca794d200a2ff9b2dece3bccc51e360fe924f29f8cdcbf0efee4bf5a"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/review-my-slop-1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c70ceab10ec86240e1670cd9142c857b0d131e23af7b78237d1884f3e5e2b160"
    sha256 cellar: :any,                 x86_64_linux: "c050005478fedf915c76b8be17aea602d621d313556ae826e422799740828687"
  end

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", "-o", "./bin/review-my-slop", "./cmd/review-my-slop"
    bin.install "./bin/review-my-slop"
  end

  test do
    ENV["XDG_DATA_HOME"] = testpath/".local/share"
    ENV["XDG_STATE_HOME"] = testpath/".local/state"

    system "git", "init"
    assert_match "No pending review comments.", shell_output("#{bin}/review-my-slop comments")
  end
end
