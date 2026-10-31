class Zipln < Formula
  desc "File and folder picker for Herdr"
  homepage "https://github.com/EskelinenAntti/zipln"
  url "https://github.com/EskelinenAntti/zipln/archive/refs/tags/v10.0.1.tar.gz"
  sha256 "9dfcf8aed13afe4d160dc20a73835151825b302747bb532b7ceccae4b4a63891"
  license "MIT"

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
