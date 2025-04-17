# Formula/historai.rb
class Historai < Formula
  desc "LLM-powered CLI Tool using your shell history to find and suggest relevant commands"
  homepage "https://github.com/sanspareilsmyn/historai"
  url "https://github.com/sanspareilsmyn/historai/archive/refs/tags/0.1.1.tar.gz"
  sha256 "e4cf3c8e24e4705eb2d5bfbefedc45827cc5212156d2267ca95278c5c139b43e"
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