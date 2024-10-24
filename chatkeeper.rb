class Chatkeeper < Formula
    desc "ChatKeeper command-line tool"
    homepage "https://martiansoftware.com/chatkeeper"
    version "1.0.1-beta-1"
  
    url "https://files.martiansoftware.com/chatkeeper/1.0.1-beta-1/chatkeeper-1.0.1-beta-1-macos-x86_64.tar.gz"
    sha256 "ce061a9d8ce1a74eb7664bf59bae6d8f003d139354cfd72bc8e9f7ade5537880"
  
    def needs_rosetta
      <<-EOS
        **********************************************************************
        *  On Apple Silicon Macs, ChatKeeper *should* run under Rosetta 2.   *
        *                                                                    *
        *  In this beta version, running under Rosetta has not been tested.  *
        *                                                                    *
        *  To install Rosetta 2, run:                                        *
        *    softwareupdate --install-rosetta --agree-to-license             *
        *                                                                    *
        *  Please send any feedback, either positive or negative, about      *
        *  your experience with ChatKeeper under Rosetta to                  *
        *  chatkeeper@martiansoftware.com.                                   *
        **********************************************************************
      EOS
    end

    def install
      if Hardware::CPU.arm?
        unless system("/usr/bin/arch", "-x86_64", "/usr/bin/true")
          odie needs_rosetta
        end
      end        
      bin.install "chatkeeper"
    end
  
    def caveats
      <<~EOS
        ChatKeeper has been installed!
  
        #{needs_rosetta}

        For more information, visit:
        https://martiansoftware.com/chatkeeper
      EOS
    end
  
    test do
      assert_predicate bin/"chatkeeper", :executable?
      output = shell_output("#{bin}/chatkeeper --version")
      assert_match "ChatKeeper version 1.0.1-beta-1", output
    end
  end
  
