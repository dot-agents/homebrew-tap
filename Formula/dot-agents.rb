class DotAgents < Formula
  desc "Unified config layer for AI coding agents"
  homepage "https://github.com/dot-agents/dot-agents"
  url "https://github.com/dot-agents/dot-agents/releases/download/v0.1.1/dot-agents-v0.1.1.tar.gz"
  sha256 "b560ee86eaf8485b980e28a9c120a78e69683c780fc48d719eea65c41898f213"
  license "MIT"
  version "0.1.1"

  def install
    bin.install "src/bin/dot-agents"
    libexec.install "src/lib"
    libexec.install "src/share"
    libexec.install "VERSION"

    # Rewrite paths for Homebrew installation
    inreplace bin/"dot-agents" do |s|
      s.gsub! 'SRC_DIR="."', "SRC_DIR=\"#{libexec}\""
      s.gsub! 'LIB_DIR="/lib"', "LIB_DIR=\"#{libexec}/lib\""
      s.gsub! 'SHARE_DIR="/share"', "SHARE_DIR=\"#{libexec}/share\""
    end
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/dot-agents --version")
  end
end
