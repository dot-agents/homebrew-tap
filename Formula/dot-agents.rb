class DotAgents < Formula
  desc "Unified config layer for AI coding agents"
  homepage "https://github.com/dot-agents/dot-agents"
  url "https://github.com/dot-agents/dot-agents/releases/download/v0.1.7/dot-agents-v0.1.7.tar.gz"
  sha256 "f7e40add3e4023d74dec0201e93aae5b87050d7d700720099b28f997c5094e62"
  license "MIT"
  version "0.1.7"

  def install
    bin.install "src/bin/dot-agents"
    libexec.install "src/lib"
    libexec.install "src/share"
    libexec.install "VERSION"

    # Rewrite paths for Homebrew installation
    inreplace bin/"dot-agents" do |s|
      s.gsub! 'SRC_DIR="$(dirname "$BIN_DIR")"', "SRC_DIR=\"#{libexec}\""
      s.gsub! 'LIB_DIR="$SRC_DIR/lib"', "LIB_DIR=\"#{libexec}/lib\""
      s.gsub! 'SHARE_DIR="$SRC_DIR/share"', "SHARE_DIR=\"#{libexec}/share\""
    end
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/dot-agents --version")
  end
end
