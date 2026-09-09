# frozen_string_literal: true

class Snip < Formula
  desc "macOS clipboard and keyboard diagnostic tool"
  homepage "https://github.com/clanzhang/snip"
  url "https://github.com/clanzhang/snip/archive/refs/tags/v0.1.28.tar.gz"
  sha256 "440c567ef8182599521ba1c3e95e7ce05c5d55f55174ac0800382974434e6055"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/snip"
  end

  test do
    system "#{bin}/snip", "--version"
  end
end