class Zipln < Formula
  desc "File and folder picker for Herdr"
  homepage "https://github.com/EskelinenAntti/zipln"
  url "https://github.com/EskelinenAntti/zipln/archive/refs/tags/v10.0.0.tar.gz"
  sha256 "822bd5895048ee301841a5db727e491a5f8a7836ca3bdf0a7ba93ae11a66476b"
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
