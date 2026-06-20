class ReviewMySlop < Formula
  desc "Terminal UI for reviewing Git changes and attaching line feedback for AI agents"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "1e90324ccce3cf2f1a7ffe488336aba93863e70023d0c5ee4e88cac6fa396b20"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/review-my-slop-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "608b1cab7e1181d652aaa64b1421c2772ef33d4fa5b20295077b03dc21bd328a"
    sha256 cellar: :any,                 x86_64_linux: "9f7a0e36bef2750e647654ea72bd01dd5ed3fd269fa84b74e5206afcd143dc03"
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
