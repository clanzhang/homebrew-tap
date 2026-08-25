# frozen_string_literal: true

class Snip < Formula
  desc "macOS clipboard and keyboard diagnostic tool"
  homepage "https://github.com/clanzhang/snip"
  url "https://github.com/clanzhang/snip/archive/refs/tags/v0.1.15.tar.gz"
  sha256 "7bfb20a52d15b1f57df2121c3f03ca0ae491a2f626b52c9036c7c1fa29fff615"
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