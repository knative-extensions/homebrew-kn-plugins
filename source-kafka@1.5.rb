require 'fileutils'

class SourceKafkaAT15 < Formula
  v = "v1.5.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "54e49bd5ab485fb7aadb10ff7d4a9380763721ce4fad033656167e73e9c9c0bb"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "86125c192efd935a97aaa46eeff9f769be9299eb442ade3ec4958cba4cdb0683"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-source-kafka-darwin-amd64", "kn-source-kafka")
    else
      FileUtils.mv("kn-source-kafka-linux-amd64", "kn-source-kafka")
    end
    bin.install "kn-source-kafka"
  end

  test do
    system "#{bin}/kn-source-kafka", "version"
  end
end
