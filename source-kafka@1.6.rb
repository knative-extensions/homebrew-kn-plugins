require 'fileutils'

class SourceKafkaAT16 < Formula
  v = "v1.6.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "47c6aa27d8370d695b8329aba955aa36b1814a669cdde26a8f4fddda78bad605"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "6aa3e517e558e4dba19febd3021ebad20e4840fc6cb408364353b8c2e233012c"
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
