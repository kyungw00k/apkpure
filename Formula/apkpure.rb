# typed: true
# frozen_string_literal: true

class Apkpure < Formula
  desc "CLI tool to download APK files from APKPure"
  homepage "https://github.com/kyungw00k/apkpure-go"
  license "MIT"
  version "1.0.0"

  url "https://github.com/kyungw00k/apkpure-go/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "78f211e6638df1baa7bb72fb96d8310bc639649371d6cf5aec176e6abcf61a7e"

  depends_on "go" => :build
  sha256 "78f211e6638df1baa7bb72fb96d8310bc639649371d6cf5aec176e6abcf61a7e"

  def install
    system "go", "build", "./cmd/apkpure"
    bin.install "apkpure"
  end

  test do
    assert_match "apkpure", shell_output("#{bin}/apkpure --help")
  end
end
