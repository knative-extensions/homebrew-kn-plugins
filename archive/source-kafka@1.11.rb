require 'fileutils'

class SourceKafkaAT111 < Formula
  v = "v1.11.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "149eee8a1ddf9752973c9fac2edc9e3d878dbc80b5c47e81cb3c56583038e013"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "cbd882e10e1f2c8f6f6890a972b85e261db988c96625cfce2ebfed0d0e74af6b"
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
