cask "latest-kotlin-lsp" do
  version "262.4739.0"

  on_arm do
    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.sit"
    sha256 "1b745743ce22ad92681a1bc3b1046803e942a6e1f36e04fb85ae9a40334a2f1e"
  end

  on_intel do
    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-x64.zip"
    sha256 "6f06efe7a10f94b9c8a028c4efeb6c7e1769f47a01edfb74450acf30ab5665e4"
  end

  name "Latest Kotlin LSP"
  desc "Kotlin Language Server"
  homepage "https://github.com/Kotlin/kotlin-lsp"

  binary "bin/intellij-server", target: "intellij-server"
end
