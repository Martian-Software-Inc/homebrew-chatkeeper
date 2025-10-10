class ChatkeeperRcAT130rc1 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.3.0-rc.1"

  conflicts_with "chatkeeper", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.3.0-rc.1/macos-x86_64/chatkeeper-1.3.0-rc.1-macos-x86_64.tar.gz"
    sha256 "b81915706224cbf8f283ee6db37c82d6bd19ab14b4556c010245169842e4b1b9"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.3.0-rc.1/macos-arm64/chatkeeper-1.3.0-rc.1-macos-arm64.tar.gz"
    sha256 "f4ef2c807d0e760ab2f525a20e5619a7f686df7d3ca12826bf84c8dd29de0ad8"
  else
    odie "Unsupported architecture"
  end

  def install
    bin.install "chatkeeper"
  end

  def caveats
    <<~EOS
    ChatKeeper converts your ChatGPT conversation export files into local
    Markdown files, making them much more useful.

    To get started, type 'chatkeeper --help', or visit
    https://martiansoftware.com/chatkeeper/quickstart

    ...and please send any feedback, positive or negative, to 
    chatkeeper@martiansoftware.com so I can keep improving it.

    Thank you for using ChatKeeper!
    EOS
  end

  test do
    assert_predicate bin/"chatkeeper", :executable?
    output = shell_output("#{bin}/chatkeeper --version")
    assert_match "ChatKeeper version 1.3.0-rc.1", output
  end
end
