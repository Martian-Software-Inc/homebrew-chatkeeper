class Chatkeeper < Formula
    desc "ChatKeeper command-line tool"
    homepage "https://martiansoftware.com/chatkeeper"
    version "1.0.0"
  
    url "https://files.martiansoftware.com/chatkeeper/1.0.0/chatkeeper-1.0.0-macos-x86_64.tar.gz"
    sha256 "dd4414d62f97c915e0513f15596089a40610f8c08bf3fb4db843379e1e9874e6"
  
    depends_on arch: :x86_64
  
    def install
      bin.install "chatkeeper"
    end
  
    def caveats
      <<~EOS
        ChatKeeper has been installed!
  
        On Apple Silicon Macs, ChatKeeper runs under Rosetta 2.
        To install Rosetta 2, run:
          softwareupdate --install-rosetta --agree-to-license
  
        For more information, visit:
        https://martiansoftware.com/chatkeeper
      EOS
    end
  
    test do
      assert_predicate bin/"chatkeeper", :executable?
      output = shell_output("#{bin}/chatkeeper --version")
      assert_match "ChatKeeper version 1.0.1", output
    end
  end
  
