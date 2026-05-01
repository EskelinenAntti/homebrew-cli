cask "latest-kotlin-lsp" do
  version "262.4739.0"

  on_arm do
    sha256 "625870ae091c6d0dee25514d545c708a6ea50d7cbb5154aaf1aa9123ccff338b"

    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.tar.gz"
  end

  on_intel do
    sha256 "1b745743ce22ad92681a1bc3b1046803e942a6e1f36e04fb85ae9a40334a2f1e"

    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-x64.tar.gz"
  end

  name "Latest Kotlin LSP"
  desc "Latest official Language Server Protocol for Kotlin"
  homepage "https://github.com/Kotlin/kotlin-lsp"

  depends_on macos: ">= :ventura"

  binary "kotlin-server-#{version}/bin/intellij-server", target: "intellij-server"
end
