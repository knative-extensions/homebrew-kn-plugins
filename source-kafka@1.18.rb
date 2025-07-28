# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# source-kafka_version:1.18.0
require "fileutils"

class SourceKafkaAT118 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kafka"

  v = "knative-v1.18.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-amd64"
    sha256 "b2e75616a13374ed10c7c8c5fc774edd7accb9dc75d16c183153c6f11d093cb7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-arm64"
    sha256 "2732c263fe84f3d14cb8a09b172bccca5f76f99cd6a539aaa7e5a3f13cd348d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-arm64"
    sha256 "a45ed7eba31667f406bdc45932c27feb7e3f614df0dfc1e075aa5dc8645370d0"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-amd64"
    sha256 "2eadbf9b694a5a7db5ca5ce6ecd33d8bf807adaec5179ca9404f4022b2f8b7e0"
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
