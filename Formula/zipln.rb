class Zipln < Formula
  desc "File and folder picker for Herdr"
  homepage "https://github.com/EskelinenAntti/zipln"
  url "https://github.com/EskelinenAntti/zipln/archive/refs/tags/v10.0.1.tar.gz"
  sha256 "9dfcf8aed13afe4d160dc20a73835151825b302747bb532b7ceccae4b4a63891"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/zipln-10.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f2bdca1ca05b7c6e3057c3c4a7939a2cd966536bbcd4d858151e8641bdc5f679"
    sha256 cellar: :any,                 x86_64_linux: "a0839f1e7308dd2b9d5158770382f3ddc9c8a626648e6f7aecce15343030d73c"
  end

  depends_on "go" => :build
  depends_on "fd"
  depends_on "fzf"
  depends_on "git"

  def install
    system "go", "build", "-o", "./bin/zipln", "./zipln"
    bin.install "./bin/zipln"

    generate_completions_from_executable(bin/"zipln", "completion")
  end

  test do
    assert_match "zipln creates or switches to herdr workspaces", shell_output("#{bin}/zipln --help")
  end
end
