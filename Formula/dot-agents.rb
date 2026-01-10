class DotAgents < Formula
  desc "Unified config layer for AI coding agents"
  homepage "https://github.com/dot-agents/dot-agents"
  url "https://github.com/dot-agents/dot-agents/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fd66f58a866cc0bbfb387fc6df9c643890c4bc7261d40e1bf30d0eacfc8e3843"
  license "MIT"

  def install
    # Install the main binary
    bin.install "src/bin/dot-agents"

    # Install library files
    libexec.install "src/lib"
    libexec.install "src/share"

    # Rewrite paths in the main script to use Homebrew locations
    inreplace bin/"dot-agents" do |s|
      s.gsub! 'SRC_DIR="$(dirname "$BIN_DIR")"', "SRC_DIR=\"#{libexec}\""
    end
  end

  test do
    assert_match "dot-agents #{version}", shell_output("#{bin}/dot-agents --version")
  end
end
