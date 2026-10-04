class ReviewMySlop < Formula
  desc "Keyboard-driven diff viewer TUI for reviewing AI code"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "ab9fc0b7dbb1c2999336c06c74a7160ca7424e07f9f55d4d83922bb93fb2f5b5"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/review-my-slop-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e59de3bd612cf5fc5630186a8be3632c27e37e9f4833c5d4620174cc2f19e33c"
    sha256 cellar: :any,                 x86_64_linux: "0256252f95118bd68cf17789843a4c9ff533e614ae3f9082dedc2f2a137f34bf"
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
