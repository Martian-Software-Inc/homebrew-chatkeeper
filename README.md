# homebrew-chatkeeper
This repository provides a [Homebrew](https://brew.sh/) tap for [ChatKeeper](https://martiansoftware.com/chatkeeper)

Mac support for ChatKeeper is Currently EXPERIMENTAL.

Mac builds of ChatKeeper currently target x86_64 architecture, but I
believe that it *should* work fine under Rosetta 2.  "Should" is
emphasized here because I do not have access to Apple silicon for testing.  If you are willing to give that a shot, I am grateful for any feedback.

**If you don't already have Rosetta installed, you need to install it first.**

## Installing Rosetta
This step is only necessary on M1/M2/M3 hardware.

- Via GUI: [If you need to install Rosetta on your Mac](https://support.apple.com/en-us/102527)
- Via Terminal: `softwareupdate --install-rosetta --agree-to-license`

## Installing ChatKeeper
- Via HomeBrew: `brew install Martian-Software-Inc/chatkeeper/chatkeeper`

## Using ChatKeeper
- [ChatKeeper Quick Start Guide](https://martiansoftware.com/chatkeeper/quickstart)