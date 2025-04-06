class ChatkeeperAT120 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.2.0"

  conflicts_with "chatkeeper-rc", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.2.0/macos-x86_64/chatkeeper-1.2.0-macos-x86_64.tar.gz"
    sha256 "eef33650fb2b22a357acb6276a7eeed08943305ad0403c5ca5260463ac39b442"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.2.0/macos-arm64/chatkeeper-1.2.0-macos-arm64.tar.gz"
    sha256 "d0c3e43201d9ea98b7e6908cc5da44d27f097418fd6454a819d00f708706bc75"
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
    assert_match "ChatKeeper version 1.2.0", output
  end
end
