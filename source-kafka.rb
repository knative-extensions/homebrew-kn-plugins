require 'fileutils'

class SourceKafka < Formula
  v = "v1.14.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "ea465a8d42c103395bfc6542d1eb022424a20774446c2a6dbe43b83f1e61b7d2"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "13174d105897eea0524d3e44ec76aedb8ebf49d56a37140062d22c07b420c366"
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
