class Chatkeeper < Formula
  desc "ChatKeeper command-line tool"
  homepage "https://martiansoftware.com/chatkeeper"
  version "1.0.1-beta-1"

  url "https://files.martiansoftware.com/chatkeeper/1.0.1-beta-1/chatkeeper-1.0.1-beta-1-macos-x86_64.tar.gz"
  sha256 "ce061a9d8ce1a74eb7664bf59bae6d8f003d139354cfd72bc8e9f7ade5537880"

  # Architecture-specific installation handling
  on_arm do
    def self.rosetta_check
      success = system("/usr/bin/arch", "-x86_64", "/usr/bin/true", out: :error, err: :error)
      return :available if success
      return :unavailable
    end

    def install
      rosetta_status = self.class.rosetta_check
      
      case rosetta_status
      when :available
        bin.install "chatkeeper"
        opoo <<~EOS
          Installing x86_64 binary on ARM processor.
          This will run under Rosetta 2 emulation.
        EOS
      else
        odie <<~EOS
          ChatKeeper requires Rosetta 2 to run on Apple Silicon Macs.

          Please install Rosetta 2 by running the following in Terminal:
            softwareupdate --install-rosetta --agree-to-license

          After installing Rosetta 2, please try installing ChatKeeper again.
        EOS
      end
    end

    def caveats
      <<~EOS
        ChatKeeper has been installed!
        
        This x86_64 binary is running under Rosetta 2 emulation on your Apple Silicon Mac.
        Please report any issues to chatkeeper@martiansoftware.com
        
        For more information, visit https://martiansoftware.com/chatkeeper
      EOS
    end
  end

  # Default installation for Intel macs
  on_intel do
    def install
      bin.install "chatkeeper"
    end

    def caveats
      <<~EOS
        ChatKeeper has been installed!
        
        For more information, visit https://martiansoftware.com/chatkeeper
      EOS
    end

  end

  test do
    assert_predicate bin/"chatkeeper", :executable?
    output = shell_output("#{bin}/chatkeeper --version")
    assert_match "ChatKeeper version 1.0.1-beta-1", output
  end
end