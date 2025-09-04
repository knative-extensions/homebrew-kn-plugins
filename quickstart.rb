# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# quickstart_version:1.19.2
require "fileutils"

class Quickstart < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-quickstart"

  v = "knative-v1.19.2"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-amd64"
    sha256 "065bbc2d8da45807d1448ae125cc31ed64eaa66a657bd2b5cba85b9dc7775cf3"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-arm64"
    sha256 "4569a42499aa10431a004887445ba12558caebc6e7be8a57a9c8bdb2087f8e53"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-arm64"
    sha256 "467432fb7ca98130b20f5dd6bf6dad99e3245b893bead39781e3aadb950bf3cb"
  else
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-amd64"
    sha256 "7579f131ede856aca05475c05926eea4cfc70fd69ea964bcc603d511f900b814"
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
