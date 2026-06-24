class ReviewMySlop < Formula
  desc "Terminal UI for reviewing Git changes and attaching line feedback for AI agents"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "e29e844fad5f1f7e02ea5a57551655bc6911c256dd06f4159d0b440613b98e2a"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/review-my-slop-1.2.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "755fce9264d08d426a77b298a7d0704ca0db6f67401d64cb92cc71e1edaf988e"
    sha256 cellar: :any,                 x86_64_linux: "372490e989fd54f841fd5f01392c8bd515e57d9668e220c82efd35e275a2e5e6"
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
