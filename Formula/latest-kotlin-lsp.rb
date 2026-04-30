class LatestKotlinLsp < Formula
  desc "Latest Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "262.4739.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^(?:#)+\s*v(.*)$/i)
  end

  depends_on :macos
  depends_on "unar" => :extract

  on_macos do
    if Hardware::CPU.intel?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-x64.zip"
      sha256 "6f06efe7a10f94b9c8a028c4efeb6c7e1769f47a01edfb74450acf30ab5665e4"
    elsif Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.sit"
      sha256 "1b745743ce22ad92681a1bc3b1046803e942a6e1f36e04fb85ae9a40334a2f1e"
    end
  end

  def install
    chmod "+x", "bin/intellij-server"

    # Move all files to libexec
    libexec.install Dir["*"]

    # 1. MASK: Compress the library so Homebrew's relocation scanner ignores it.
    # Gzip changes the magic bytes, preventing the 'install_name_tool' attempt.
    if Hardware::CPU.arm?
      jnilib = libexec/"lib/native/mac-aarch64/libsqliteij.jnilib"
      system "gzip", "-n", jnilib if jnilib.exist?
    end

    (bin/"intellij-server").write_env_script(
      "#{libexec}/bin/intellij-server",
      {}
    )
  end

  def post_install
    if Hardware::CPU.arm?
      jnilib_gz = libexec/"lib/native/mac-aarch64/libsqliteij.jnilib.gz"
      system "gunzip", jnilib_gz if jnilib_gz.exist?
    end
  end

  test do
    assert_match "Usage: kotlin-lsp", shell_output("#{bin}/intellij-server -h")
  end
end
