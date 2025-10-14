# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# func_version:1.19.4
require "fileutils"

class Func < Formula
  homepage "https://github.com/knative/func"

  v = "knative-v1.19.4"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_amd64"
    sha256 "c2a10bc0046457b6ebd746463e97b423f17456fc1426ac5dad576fafc854538b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_arm64"
    sha256 "3010a45b64a11fbe6fb17b84827443194c4eaedabe7fa82c9f92f98303ff5622"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_arm64"
    sha256 "f623eee8c8261894808c3b9133c3ce440b2e54c0577f3f04da74cc17535d88e8"
  else
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_amd64"
    sha256 "aa011deda3e68f98483fe325ac4e08d5c426beffc00ee8f3503240773f6cab6f"
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
