cask "latest-kotlin-lsp" do
  version "262.4739.0"

  on_arm do
    sha256 "46971110c9b8a3360ce3fdf5437467f4c447dad37ad73dbf81d64af6779e4105"

    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.tar.gz"
  end

  on_intel do
    sha256 "625870ae091c6d0dee25514d545c708a6ea50d7cbb5154aaf1aa9123ccff338b"

    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-x64.tar.gz"
  end

  name "Latest Kotlin LSP"
  desc "Latest official Language Server Protocol for Kotlin"
  homepage "https://github.com/Kotlin/kotlin-lsp"

  depends_on macos: ">= :ventura"

  binary "kotlin-server-#{version}/bin/intellij-server", target: "intellij-server"
end
