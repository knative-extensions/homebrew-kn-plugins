# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# source-kafka_version:1.19.1
require "fileutils"

class SourceKafka < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kafka"

  v = "knative-v1.19.1"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-amd64"
    sha256 "5bda08e291cdedf8f6118f850adc395c1cb9ec963d3105152bc9c34e1f55bebe"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-darwin-arm64"
    sha256 "8a88922efcd5bf53d9f4cc52725dbfcedfaafcc1076c779d4fd111f9c7754f7d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-arm64"
    sha256 "81a3ecd332639f824230670a2977a0ea87c9c84c2097059e8b81faed4fbba82e"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kafka/releases/download/#{v}/kn-source-kafka-linux-amd64"
    sha256 "85afcfa3830dafd98898588536df0a707fedc47b6d75fd2cf8e16c86e14f4fae"
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
