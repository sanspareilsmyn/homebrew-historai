# Formula/historai.rb
class Historai < Formula
  desc "LLM-powered CLI Tool using your shell history to find and suggest relevant commands"
  homepage "https://github.com/sanspareilsmyn/historai"
  url "https://github.com/sanspareilsmyn/historai/archive/refs/tags/0.1.0.tar.gz"
  sha256 "e186bcd30e1d01f893fa49e901702a7a1d66ab58de6e5a86f58b8dd2c4f8bd48"
  license "Apache License 2.0"

  depends_on "go" => :build
  depends_on "kubernetes-cli"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"historai", "./cmd/historai"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/historai --help")
  end
end