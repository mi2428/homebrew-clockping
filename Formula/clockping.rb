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
      url "https://github.com/mi2428/clockping/releases/download/v1.0.0/clockping-v1.0.0-darwin-arm64",
          using: :nounzip
      sha256 "b99b58946bc8e98ef531c69588e4e55a9cdfcc02de951cbb361efc7f438249a9"
    end

    on_intel do
      url "https://github.com/mi2428/clockping/releases/download/v1.0.0/clockping-v1.0.0-darwin-amd64",
          using: :nounzip
      sha256 "77ae2e870a224f0801e5e57e30602271bc089fd048694a61b7d12c4f4d5a36e2"
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
