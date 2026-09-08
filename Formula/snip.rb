# frozen_string_literal: true

class Snip < Formula
  desc "macOS clipboard and keyboard diagnostic tool"
  homepage "https://github.com/clanzhang/snip"
  url "https://github.com/clanzhang/snip/archive/refs/tags/v0.1.21.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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