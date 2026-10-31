class Zipln < Formula
  desc "File and folder picker for Herdr"
  homepage "https://github.com/EskelinenAntti/zipln"
  url "https://github.com/EskelinenAntti/zipln/archive/refs/tags/v8.2.2.tar.gz"
  sha256 "e90ed098cd42055c2d7491eae87c449ba48ac69fe0f632ad6e7e6351614ecb99"
  license "MIT"

  bottle do
    root_url "https://github.com/EskelinenAntti/homebrew-cli/releases/download/zipln-8.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4b714441998542af29994f177687711bbc445658848263de0a5dadc1447f97da"
    sha256 cellar: :any,                 x86_64_linux: "6f2418840c276dec96b7311307328d9f8af286aa9caf8c3b17335854e0f27882"
  end

  depends_on "go" => :build
  depends_on "fd"
  depends_on "fzf"
  depends_on "git"

  def install
    system "go", "build", "-o", "./bin/ide", "./ide"
    bin.install "./bin/ide"

    generate_completions_from_executable(bin/"ide", "completion")
  end

  test do
    assert_match "zipln creates or switches to herdr sessions", shell_output("#{bin}/ide --help")
  end
end
