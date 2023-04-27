require 'fileutils'

class SourceKafkaAT19 < Formula
  v = "v1.9.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "2da5d7823a831c9bff0138a348682f88df4976ce9e228b4267656ec96e7f9208"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "a877c8c8494f8c0550487bbed1bf1250439a6c1c2a01a19336571d96e2c9f0e4"
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
