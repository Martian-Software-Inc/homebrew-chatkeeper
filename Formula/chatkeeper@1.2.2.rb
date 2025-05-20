class ChatkeeperAT122 < Formula
  desc "Convert ChatGPT conversation exports into local Markdown files"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.2.2"

  conflicts_with "chatkeeper-rc", because: "both install a 'chatkeeper' binary"

  if Hardware::CPU.intel?
    url "https://files.martiansoftware.com/chatkeeper/1.2.2/macos-x86_64/chatkeeper-1.2.2-macos-x86_64.tar.gz"
    sha256 "dd1a790e48aa584ceba082b9b0393f078a17ce5f0be5000d7a420408f71faeff"
  elsif Hardware::CPU.arm?
    url "https://files.martiansoftware.com/chatkeeper/1.2.2/macos-arm64/chatkeeper-1.2.2-macos-arm64.tar.gz"
    sha256 "e8a896ad26fa8e06551bdfebf95472db7781c87207ef4d775ffc90f326a17eba"
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
    assert_match "ChatKeeper version 1.2.2", output
  end
end
