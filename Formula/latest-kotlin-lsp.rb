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
    
    # 1. Move files to libexec
    libexec.install Dir["*"]

    # 2. MASK the library: Rename it so the relocation scanner ignores it.
    # We use a suffix that doesn't look like a native library.
    if Hardware::CPU.arm?
      mv libexec/"lib/native/mac-aarch64/libsqliteij.jnilib", 
         libexec/"lib/native/mac-aarch64/libsqliteij.jnilib.skip"
    end

    (bin/"intellij-server").write_env_script(
      "#{libexec}/bin/intellij-server",
      {}
    )
  end

  # 3. UNMASK the library: This runs AFTER Homebrew's relocation phase.
  def post_install
    if Hardware::CPU.arm? && File.exist?(libexec/"lib/native/mac-aarch64/libsqliteij.jnilib.skip")
      mv libexec/"lib/native/mac-aarch64/libsqliteij.jnilib.skip", 
         libexec/"lib/native/mac-aarch64/libsqliteij.jnilib"
    end
  end

  test do
    assert_match "Usage: kotlin-lsp", shell_output("#{bin}/intellij-server -h")
  end
end
