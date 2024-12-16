class Chatkeeper_AT_1_1_0 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.1.0"

  conflicts_with "chatkeeper-rc", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.1.0/macos-x86_64/chatkeeper-1.1.0-macos-x86_64.tar.gz"
    sha256 "b8d701083a9b84188a877c0efeadb7b09f5d1f10e9045d1fa193407fe2da93ef"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.1.0/macos-arm64/chatkeeper-1.1.0-macos-arm64.tar.gz"
    sha256 "target/macos-arm64/chatkeeper-1.1.0-macos-arm64.tar.gz.sha256"
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
    assert_match "ChatKeeper version 1.1.0", output
  end
end
