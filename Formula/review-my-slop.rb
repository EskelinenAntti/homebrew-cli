class ReviewMySlop < Formula
  desc "Keyboard-driven diff viewer TUI for reviewing AI code"
  homepage "https://github.com/EskelinenAntti/review-my-slop"
  url "https://github.com/EskelinenAntti/review-my-slop/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "ab9fc0b7dbb1c2999336c06c74a7160ca7424e07f9f55d4d83922bb93fb2f5b5"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/review-my-slop-1.2.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7ff37f11b53a9c31aa67814a9227a518f84c99502d9f27abadd9a4fd32429c37"
    sha256 cellar: :any,                 x86_64_linux: "0b44cd7e362f0d7c464e91d0f752eea017baf1aa3aa3a099e50793f382f29229"
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
