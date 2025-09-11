# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# quickstart_version:1.19.3
require "fileutils"

class Quickstart < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-quickstart"

  v = "knative-v1.19.3"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-amd64"
    sha256 "7d1c7f282e38776070b8c3b6a454c197a487517f770f6a89ca82c5b193caf5f1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-arm64"
    sha256 "004703faaa28d19a0088add3670419c46bb0b9d784dc4c8a61dc67217f07a305"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-arm64"
    sha256 "0ffb924eeee1d7e9b22f33f0dc584096a4f1383c95e067c0c02512aca17d674a"
  else
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-amd64"
    sha256 "0e6c6fae2fff61ca0a11407e76f7da1bed6e827e137c923d209d62ec3a4d6f2b"
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
