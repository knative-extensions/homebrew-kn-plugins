# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# quickstart_version:1.18.0
require "fileutils"

class QuickstartAT118 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-quickstart"

  v = "knative-v1.18.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-amd64"
    sha256 "9caf6f90221842d6a9715dc5628a5e48704712fa345720d1c62386ba974d70d8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-arm64"
    sha256 "862a276c580e1f1f72c947c1c01584254e5124dba946983da2f38c441a06c2ce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-arm64"
    sha256 "df5fbf753c7de4d929fb1e77cae09c3963c12e074f965a2c081ff0dc8a61986d"
  else
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-amd64"
    sha256 "f51c9ad0e774cdc7d8b75cbc57294f71d25f55fdc7cb28ddaab05ebc3f925e69"
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
