# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# source-kafka_version:1.17.0
require "fileutils"

class SourceKafka < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kafka"

  v = "knative-v1.17.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-amd64"
    sha256 "6eafad8456e9ba9d2d24e2ab328923be665535670dc4b0e4267999726388ffb5"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-arm64"
    sha256 "de2a5f2f403d2d1f3ef2b1cdaaac00aa19299416f482f9e2c5948a725a7a63ad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-arm64"
    sha256 "93879e4d15ee02318ab4a44ef4eabcb06609cd0e4e7b2c7b7284dec205ed8bec"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-amd64"
    sha256 "6ef365e7dbd31906d2049b9e16e1e34c0d9dd0c45f9a5781f016e4bec22978af"
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
