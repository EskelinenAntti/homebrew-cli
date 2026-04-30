class LatestKotlinLsp < Formula
  desc "Latest Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "262.4739.0"
  license "Apache-2.0"

  bottle do
    cellar :any_skip_relocation
  end

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

  # This prevents Homebrew from stripping the binaries, 
  # which can also cause header issues.
  skip_clean :all

  def install
    # 1. Fix permissions before moving
    chmod "+x", "bin/intellij-server"

    # 2. Install to 'share' instead of 'libexec'. 
    # Homebrew's relocation logic is less aggressive here.
    share.install Dir["*"]

    # 3. Create a wrapper script
    # JetBrains tools often rely on their internal relative paths. 
    # A symlink sometimes breaks them, but a wrapper script is rock solid.
    (bin/"intellij-server").write_env_script "#{share}/bin/intellij-server", {}
  end

  test do
    assert_match "Usage: kotlin-lsp", shell_output("#{bin}/intellij-server -h")
  end
end
