# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# source-kafka_version:1.19.3
require "fileutils"

class SourceKafka < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kafka"

  v = "knative-v1.19.3"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-amd64"
    sha256 "c3d66a604dcebffcd7dda76713c3b6eb8f190636bbad0b946cbb6a8fc12be0af"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-arm64"
    sha256 "4d09fd949a8d97065f6f3865a028001a8b2f1c305798ad6cbeffcf91df00b4fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-arm64"
    sha256 "25b2a31c98cde2232a3cdc33aec0011fab875d7413999f4043e3c25475e4434b"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-amd64"
    sha256 "4a6a37aa2dcffe6d6205daf3058be50f433a19fba3c48411ca3b6c8fd75eb6b8"
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
