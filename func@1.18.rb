# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# func_version:1.18.1
require "fileutils"

class FuncAT118 < Formula
  homepage "https://github.com/knative/func"

  v = "knative-v1.18.1"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_amd64"
    sha256 "a8964afef147879891e4ed51f3842aba7a9cfc415f8a86f282285256baa71ba5"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_arm64"
    sha256 "c4ae369294426d0368e5a6d753b82d3abd821be974b31b4815964b5ad12bdf9c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_arm64"
    sha256 "2e29edec6a4dfdeeba0bc71dfc6d4c6524876ba932b7d95660580195c4cbe21f"
  else
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_amd64"
    sha256 "4a1c0c68914a399e4ae380b60cfdd931883298ca104c19c964a16f668ae386d5"
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
