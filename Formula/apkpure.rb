# typed: true
# frozen_string_literal: true

class Apkpure < Formula
  desc "CLI tool to download APK files from APKPure"
  homepage "https://github.com/kyungw00k/apkpure-go"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/kyungw00k/apkpure-go/releases/download/v1.0.0/apkpure-go_darwin_arm64.tar.gz"
      sha256 "94570436630ad922c3044626f3b5a5be1777f052f7dbfabeafa4f21d01be5684"
    end

    on_intel do
      url "https://github.com/kyungw00k/apkpure-go/releases/download/v1.0.0/apkpure-go_darwin_amd64.tar.gz"
      sha256 "c19981f47483c05d9aeb851ab132aef5a64b40ca2b8b12d141e7655b48ae68d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kyungw00k/apkpure-go/releases/download/v1.0.0/apkpure-go_linux_arm64.tar.gz"
      sha256 "14158c23db323b4d9ac0bf65d87a0af5478f8d91c477b91d63a57a0ed7760a81"
    end

    on_intel do
      url "https://github.com/kyungw00k/apkpure-go/releases/download/v1.0.0/apkpure-go_linux_amd64.tar.gz"
      sha256 "a79927fa22329a0af5358b345c4582b8383e34bdcbb669f387e1779507cf95de"
    end
  end

  def install
    bin.install "apkpure"
  end

  test do
    assert_match "apkpure", shell_output("#{bin}/apkpure --help")
  end
end
