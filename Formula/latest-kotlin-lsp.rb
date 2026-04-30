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
    # 1. Patch the ID before moving files.
    # We use a glob to handle the architecture-specific paths in the vendor bundle.
    Dir.glob("lib/native/mac-*/libsqliteij.jnilib").each do |file|
      system "install_name_tool", "-id", "@rpath/libsqliteij.jnilib", file
    end

    # 2. Make the original binary executable
    chmod "+x", "bin/intellij-server"

    # 3. Move everything into libexec to keep the prefix clean
    libexec.install Dir["*"]

    # 4. Create the wrapper script in bin. 
    # We explicitly ensure the path is clear to avoid the 'Will not overwrite' error.
    bin.mkpath
    rm_f bin/"intellij-server"
    (bin/"intellij-server").write_env_script(
      "#{libexec}/bin/intellij-server",
      {}
    )
  end

  test do
    assert_match "Usage: kotlin-lsp", shell_output("#{bin}/intellij-server -h")
  end
end
