# typed: false
# frozen_string_literal: true

class Clockping < Formula
  desc "A multi-protocol, multi-target pinger for watching hosts go dark"
  homepage "https://github.com/mi2428/clockping"
  version "1.0.3"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.3/clockping-v1.0.3-darwin-arm64",
          using: :nounzip
      sha256 "294ac4f145dc5bde651eab349c849ba4440bfdbcf9b2c8bd623c0bfc83dcfa9f"
    end

    on_intel do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.3/clockping-v1.0.3-darwin-amd64",
          using: :nounzip
      sha256 "15f0afd1247c43311d1ce11b6069a42e323960c39d73ce360c1370a609e64db6"
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
