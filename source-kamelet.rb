# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# source-kamelet_version:1.15.0
require "fileutils"

class SourceKamelet < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kamelet"

  v = "knative-v1.15.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-darwin-amd64"
    sha256 "c73c6c91072e7c0711c3009142568acbbe15e14d7d06eee227524a0eed92bc3a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-darwin-arm64"
    sha256 "22096c97ee527d7eeb9ec099124e461af8f113a0b67961c916ba82111cd86922"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-linux-arm64"
    sha256 "6ba24bf78d912a211e8b38400a5bb8640087d1b045249e2e2d5020b08f13a721"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-linux-amd64"
    sha256 "4540e8abb1e735631485cbd362b121e817f8f1d36c6282ffada1f59d8d9eeffa"
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
