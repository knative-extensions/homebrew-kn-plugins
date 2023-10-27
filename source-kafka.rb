require 'fileutils'

class SourceKafka < Formula
  v = "v1.12.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "ffffcfbd240e57ac96fb566ce694dccfe71a80e34bceaa58c48cf7fa2473a4b3"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "a41448edf4addfd8ea83b1f4102af8aa17792d0d440c845314559fd748d0bf7a"
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
