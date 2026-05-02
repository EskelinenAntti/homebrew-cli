cask "latest-kotlin-lsp" do
  version "262.4739.0"

  on_arm do
    sha256 "1b745743ce22ad92681a1bc3b1046803e942a6e1f36e04fb85ae9a40334a2f1e"

    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.sit"
  end

  on_intel do
    sha256 "6f06efe7a10f94b9c8a028c4efeb6c7e1769f47a01edfb74450acf30ab5665e4"

    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-x64.sit"
  end

  name "Latest Kotlin LSP"
  desc "Latest official Language Server Protocol for Kotlin"
  homepage "https://github.com/Kotlin/kotlin-lsp"

  depends_on macos: ">= :ventura"

  binary "kotlin-server-#{version}/bin/intellij-server", target: "intellij-server"

  postflight do
    arch = Hardware::CPU.arm? ? "macOS-AArch64" : "macOS-X64"

    system "xattr -d com.apple.quarantine #{HOMEBREW_PREFIX}/bin/intellij-server"
    system "xattr -d com.apple.quarantine #{staged_path}/kotlin-server-#{version}/lib/filewatcher/#{arch}/libfilewatcher_jni.dylib"
  end
end
