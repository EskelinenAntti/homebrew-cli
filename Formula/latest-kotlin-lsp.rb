class LatestKotlinLsp < Formula
  desc "Latest Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "262.4739.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^(?:#)+\s*v(.*)$/i)
  end

  # We don't want to support brew packages on Linux (On Linux, people should be using their native package managers)
  depends_on :macos
  depends_on "unar" => :extract

  on_macos do
    if Hardware::CPU.intel?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-x64.zip"
      sha256 "6f06efe7a10f94b9c8a028c4efeb6c7e1769f47a01edfb74450acf30ab5665e4"

      define_method(:install) do
        chmod "+x", "bin/intellij-server.sh"
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/intellij-server.sh" => "intellij-server"
      end
    end
    if Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.sit"
      sha256 "1b745743ce22ad92681a1bc3b1046803e942a6e1f36e04fb85ae9a40334a2f1e"

      define_method(:install) do
        chmod "+x", "bin/intellij-server.sh"
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/intellij-server.sh" => "intellij-server"
      end
    end
  end

  test do
    # kotlin-lsp doesn't have --version flag
    assert_equal "Usage: kotlin-lsp [OPTIONS]", shell_output("#{bin}/intellij-server -h").split("\n").first
  end
end
