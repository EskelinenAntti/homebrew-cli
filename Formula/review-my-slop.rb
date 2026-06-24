class ReviewMySlop < Formula
  desc "Terminal UI for reviewing Git changes and attaching line feedback for AI agents"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "e29e844fad5f1f7e02ea5a57551655bc6911c256dd06f4159d0b440613b98e2a"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/review-my-slop-1.2.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3fb72805e36af58552fea52eeb848c08079372d3bae39c82ea75d112f091974a"
    sha256 cellar: :any,                 x86_64_linux: "0ad663ed2f6ae9cc0e8ee360a0fd28c18ac4368150300408988445d4f7d81933"
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
