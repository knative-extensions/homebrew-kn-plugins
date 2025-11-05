# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# quickstart_version:1.19.4
require "fileutils"

class Quickstart < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-quickstart"

  v = "knative-v1.19.4"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-amd64"
    sha256 "588d9427ddfd89066524551ed45f98a23155fd4029bf197c15b8e7641695e400"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-arm64"
    sha256 "125213da226f7f12b8dce8c22f34e9a7d48e277e353684b6f9e5f49937db3dfc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-arm64"
    sha256 "c121d59f4ee2dd12a2122db458c4c39bd6af3edbe9c0e5732df4385162f0a1f3"
  else
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-amd64"
    sha256 "1f736779a6c4d1af5654218e8435cefda22549e9184b5d99e5ce5b90fafc9078"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-quickstart-darwin-amd64", "kn-quickstart")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-quickstart-darwin-arm64", "kn-quickstart")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-quickstart-linux-arm64", "kn-quickstart")
    else
      FileUtils.mv("kn-quickstart-linux-amd64", "kn-quickstart")
    end
    bin.install "kn-quickstart"
    
  end

  test do
    system "#{bin}/kn-quickstart", "version"
  end
end
