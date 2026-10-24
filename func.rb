# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# func_version:1.23.3
require "fileutils"

class Func < Formula
  homepage "https://github.com/knative/func"

  v = "knative-v1.23.3"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_amd64"
    sha256 "8d69a2a2490f404ebd921cfaabf6f311ddc102d4cff890d2fe2724e3de8ce16e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_arm64"
    sha256 "fdabcf708c59a7e6aa3f3a4139f570c624cce86a5aced1ee57146ea8b901589b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_arm64"
    sha256 "fdadc1705f76cf7fdff41f31fbf916fc3b561000fea44b550719c8fbca9af3e5"
  else
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_amd64"
    sha256 "732d00c01ecf096bb0aba46731770f332b58054d93a711c60f952f5636381ac3"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("func_darwin_amd64", "kn-func")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("func_darwin_arm64", "kn-func")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("func_linux_arm64", "kn-func")
    else
      FileUtils.mv("func_linux_amd64", "kn-func")
    end
    bin.install "kn-func"
    ln_s "kn-func", bin/"func"
  end

  test do
    system "#{bin}/kn-func", "version"
  end
end
