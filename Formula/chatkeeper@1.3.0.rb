class ChatkeeperAT130 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.3.0"

  conflicts_with "chatkeeper-rc", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.3.0/macos-x86_64/chatkeeper-1.3.0-macos-x86_64.tar.gz"
    sha256 "2fa22b6e1cb3f172469048526283712029677acb5340519d0de0767075c6ea49"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.3.0/macos-arm64/chatkeeper-1.3.0-macos-arm64.tar.gz"
    sha256 "6f9dd073ca4e8a06a6f80c7d704d8f9170abe08ef73c2ea68a38d6d2f80a1912"
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
    assert_match "ChatKeeper version 1.3.0", output
  end
end
