require 'fileutils'

class SourceKafkaAT113 < Formula
  v = "v1.13.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "ee03c9c20694139d9db07206aebaf11bb0e85bb3bed1e3360830343541c6076e"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "e7d55573d284c219e4f54d791fd620657bcdb57711c06b527ebda3f79c783412"
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
