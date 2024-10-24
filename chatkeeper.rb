class Chatkeeper < Formula
    desc "ChatKeeper command-line tool"
    homepage "https://martiansoftware.com/chatkeeper"
    version "1.0.1-beta-1"
  
    url "https://files.martiansoftware.com/chatkeeper/1.0.1-beta-1/chatkeeper-1.0.1-beta-1-macos-x86_64.tar.gz"
    sha256 "ce061a9d8ce1a74eb7664bf59bae6d8f003d139354cfd72bc8e9f7ade5537880"
  
    def rosetta_installed?
      @rosetta_installed ||= system("/usr/bin/arch", "-x86_64", "/usr/bin/true")
    end
  
    def rosetta_message
      base_message = <<-EOS
        **********************************************************************
        *  On Apple Silicon Macs, ChatKeeper *should* run under Rosetta 2.   *
        *                                                                    *
        *  In this beta version, running under Rosetta has not been tested.  *
        *                                                                    *
      EOS
  
      install_instructions = if rosetta_installed?
        <<-EOS
        *  It looks like Rosetta 2 is already installed.                     *
        *                                                                    *
        EOS
      else
        <<-EOS
        *  To install Rosetta 2, run:                                        *
        *    softwareupdate --install-rosetta --agree-to-license             *
        *                                                                    *
        EOS
      end
  
      feedback_message = <<-EOS
        *  Please send any feedback, either positive or negative, about      *
        *  your experience with ChatKeeper under Rosetta to                  *
        *  chatkeeper@martiansoftware.com.                                   *
        **********************************************************************
      EOS
  
      base_message + install_instructions + feedback_message
    end
  
    def install
      if Hardware::CPU.arm?
        odie rosetta_message unless rosetta_installed?
      end
      bin.install "chatkeeper"
    end
  
    def caveats
      <<~EOS
        ChatKeeper has been installed!
  
        #{rosetta_message if Hardware::CPU.arm?}
  
        For more information, visit https://martiansoftware.com/chatkeeper
      EOS
    end
  
    test do
      assert_predicate bin/"chatkeeper", :executable?
      output = shell_output("#{bin}/chatkeeper --version")
      assert_match "ChatKeeper version 1.0.1-beta-1", output
    end
  end