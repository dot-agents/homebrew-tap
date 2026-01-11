class DotAgents < Formula
  desc "Unified config layer for AI coding agents"
  homepage "https://github.com/dot-agents/dot-agents"
  url "https://github.com/dot-agents/dot-agents/releases/download/v0.1.4/dot-agents-v0.1.4.tar.gz"
  sha256 "36996165ceee8aa99ce4b0a84949f3560413a5c22849ca13e050003688384caf"
  license "MIT"
  version "0.1.4"

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
    assert_match "0.1.4", shell_output("#{bin}/dot-agents --version")
  end
end
