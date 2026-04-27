# typed: false
# frozen_string_literal: true

class Clockping < Formula
  desc "A multi-protocol, multi-target pinger for watching hosts go dark"
  homepage "https://github.com/mi2428/clockping"
  version "1.0.0"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.0/clockping-darwin-arm64",
          using: :nounzip
      sha256 "ff8e3d5f84867a62b7724623162cfb49450a22e879bf6f01c90cad03090ed06f"
    end

    on_intel do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.0/clockping-darwin-amd64",
          using: :nounzip
      sha256 "bb99371a2c1a8ceb2814370b7c7acd4beb071e3a2ad1faf818e9ea9bd6bbba82"
    end
  end

  def install
    bin.install Dir["clockping-darwin-*"].first => "clockping"
    generate_completions_from_executable(bin/"clockping", "completion")
  end

  test do
    assert_match "clockping #{version}", shell_output("#{bin}/clockping --version")
    assert_match "Usage:", shell_output("#{bin}/clockping --help")
  end
end
