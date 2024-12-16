class ChatkeeperRcAT110rc1 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.1.0-rc.1"

  conflicts_with "chatkeeper", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.1.0-rc.1/macos-x86_64/chatkeeper-1.1.0-rc.1-macos-x86_64.tar.gz"
    sha256 "1aab3f8e4750a31356cbbf5d0a2904256138f2a9aac78eda162bce9b617605e9"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.1.0-rc.1/macos-arm64/chatkeeper-1.1.0-rc.1-macos-arm64.tar.gz"
    sha256 "17a7dd959c8ebd791ba408e77bd5e0dac004761a479404f5adb595dbec249327"
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
    assert_match "ChatKeeper version 1.1.0-rc.1", output
  end
end
