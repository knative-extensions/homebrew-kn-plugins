# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# source-kamelet_version:1.14.0
require "fileutils"

class Source-kameletAT114 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kamelet"

  v = "knative-v1.14.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-darwin-amd64"
    sha256 "055db315e0c1ef326d57ef95ef4cc85cde056fc0d1c2289266d0c501e8c793f5"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-darwin-arm64"
    sha256 "48e985b6dd6fa00f4d009ca3f9014fc010f70455c9c5eb42e3eedda16b182845"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-linux-arm64"
    sha256 "48aa7c2c4b15949ac0549f2456dad05381faca3435d256afffd1c22588f56f7b"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-linux-amd64"
    sha256 "a995e7a1b6c0a0304e8ac1f645b53a31db465b52a48d91fa89db1b3bcfa30487"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-source-kamelet-darwin-amd64", "kn-source-kamelet")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-source-kamelet-darwin-arm64", "kn-source-kamelet")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-source-kamelet-linux-arm64", "kn-source-kamelet")
    else
      FileUtils.mv("kn-source-kamelet-linux-amd64", "kn-source-kamelet")
    end
    bin.install "kn-source-kamelet"
    
  end

  test do
    system "#{bin}/kn-source-kamelet", "version"
  end
end
