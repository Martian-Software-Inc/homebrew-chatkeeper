class ChatkeeperAT121 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.2.1"

  conflicts_with "chatkeeper-rc", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.2.1/macos-x86_64/chatkeeper-1.2.1-macos-x86_64.tar.gz"
    sha256 "43524c9ad435ee3c4e1fc61aac3e6196bf2e43b54a031405a152508afd4e4b5e"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.2.1/macos-arm64/chatkeeper-1.2.1-macos-arm64.tar.gz"
    sha256 "36bdc0701d0bd0914c01e34d7d8b8973e6c8deaa1710d7674af89558bc6ee5b6"
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
    assert_match "ChatKeeper version 1.2.1", output
  end
end
