class ChatkeeperAT111 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.1.1"

  conflicts_with "chatkeeper-rc", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.1.1/macos-x86_64/chatkeeper-1.1.1-macos-x86_64.tar.gz"
    sha256 "62066be9c8119409ef420a553c9aa78a62d2f0e35031b5c2a3cba166c17c567f"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.1.1/macos-arm64/chatkeeper-1.1.1-macos-arm64.tar.gz"
    sha256 "cc53b8f1d3a8ce00a87b5e51477f657efd0ac2b735ea09fdc545d376cca12320"
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
    assert_match "ChatKeeper version 1.1.1", output
  end
end
