# typed: false
# frozen_string_literal: true

class Clockping < Formula
  desc "A multi-protocol, multi-target pinger for watching hosts go dark"
  homepage "https://github.com/mi2428/clockping"
  version "1.0.2"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.2/clockping-v1.0.2-darwin-arm64",
          using: :nounzip
      sha256 "36909049478bae41a553b426cd2e112c9345fc0b1501ce449d44922120298074"
    end

    on_intel do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.2/clockping-v1.0.2-darwin-amd64",
          using: :nounzip
      sha256 "18844cba54b854c2a4f4e0c1aa33d72472afbfc004f403ccd63d0387cba45e2e"
    end
  end

  def install
    bin.install Dir["clockping-v#{version}-darwin-*"].first => "clockping"
    chmod 0755, bin/"clockping"
  end

  test do
    assert_match "clockping #{version}", shell_output("#{bin}/clockping --version")
    assert_match "Usage:", shell_output("#{bin}/clockping --help")
  end
end
