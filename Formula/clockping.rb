# typed: false
# frozen_string_literal: true

class Clockping < Formula
  desc "A multi-protocol, multi-target pinger for watching hosts go dark"
  homepage "https://github.com/mi2428/clockping"
  version "1.0.1"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.1/clockping-v1.0.1-darwin-arm64",
          using: :nounzip
      sha256 "49f954e3ca2b524a10a098b5ee8525e45fb1605318506e2e0aeab27f797acd29"
    end

    on_intel do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.1/clockping-v1.0.1-darwin-amd64",
          using: :nounzip
      sha256 "0abc86a53c994857140f12c454d2e19f62717d7796d82dab18ce66d9af198103"
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
