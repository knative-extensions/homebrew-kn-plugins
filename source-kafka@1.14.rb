# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# source-kafka_version:1.14.0
require "fileutils"

class Source-kafkaAT114 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kafka"

  v = "knative-v1.14.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-amd64"
    sha256 "ea465a8d42c103395bfc6542d1eb022424a20774446c2a6dbe43b83f1e61b7d2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-arm64"
    sha256 "9fff1317e1a81235f1d30e61b291972dfc30d7b292ca44645ff9ba5cfd5f6712"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-arm64"
    sha256 "ccce3127baf79b52d4440af90e63cb2e339e7dae1b2e2b24dc1c594fac807449"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-amd64"
    sha256 "13174d105897eea0524d3e44ec76aedb8ebf49d56a37140062d22c07b420c366"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-source-kafka-darwin-amd64", "kn-source-kafka")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-source-kafka-darwin-arm64", "kn-source-kafka")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-source-kafka-linux-arm64", "kn-source-kafka")
    else
      FileUtils.mv("kn-source-kafka-linux-amd64", "kn-source-kafka")
    end
    bin.install "kn-source-kafka"
    
  end

  test do
    system "#{bin}/kn-source-kafka", "version"
  end
end
