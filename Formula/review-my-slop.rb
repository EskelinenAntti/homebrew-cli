class ReviewMySlop < Formula
  desc "Terminal UI for reviewing Git changes and attaching line feedback for AI agents"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a29457ab92a5f582c73e57b55917aa9d11766c23031ccc5e7b770072d8c21f35"
  license "MIT"

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
