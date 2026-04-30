cask "latest-kotlin-lsp" do
  arch arm: "aarch64", intel: "x64"

  version "262.4739.0"

  sha256 arm:   "1b745743ce22ad92681a1bc3b1046803e942a6e1f36e04fb85ae9a40334a2f1e",
         intel: "6f06efe7a10f94b9c8a028c4efeb6c7e1769f47a01edfb74450acf30ab5665e4"

  url arm:   "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.sit",
      intel: "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-x64.sit"

  name "Latest Kotlin LSP"
  desc "Latest official Language Server Protocol for Kotlin"
  homepage "https://github.com/Kotlin/kotlin-lsp"

  depends_on macos: ">= :ventura"

  binary "bin/intellij-server", target: "intellij-server"
end
