class Tmuxide < Formula
  desc "Turn your terminal into an ide"
  homepage "https://github.com/EskelinenAntti/tmuxide"
  url "https://github.com/EskelinenAntti/tmuxide/archive/refs/tags/v5.9.2.tar.gz"
  sha256 "956a5f2c1205f7423c4435e05067d16393b3903e2d8755ef0d80c331abfda081"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/tmuxide-5.9.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1d80aa364028721849ebb241264faf7d11ed4cc0e97108802bc5e2fbd0233396"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7f02a92a1f0f96ef39c82952d7bfeb1d85e2ac86c20e5259fe0438970045c389"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end
end
