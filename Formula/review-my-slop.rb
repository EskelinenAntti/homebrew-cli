class ReviewMySlop < Formula
  desc "Terminal UI for reviewing Git changes and attaching line feedback for AI agents"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "e0b3a60c60936d0cd9d843ef19766977ee8a93f73e87ec5d7a5dc2e941ac7f5e"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/review-my-slop-1.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4cd0bc193e3f7fe5cfd4c25f266bd9b7b51c598418b36ffab692edc59fe2adfb"
    sha256 cellar: :any,                 x86_64_linux: "384f0f031673a58fc8cf2d459cb99f54cd859eacd51a087dad6412af6be09666"
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
