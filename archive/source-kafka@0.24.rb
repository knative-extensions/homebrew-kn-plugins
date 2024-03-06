require 'fileutils'

class SourceKafkaAT024 < Formula
  v = "v0.24.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "535065e8ad0a9fd9b202eac8282d9a8cbb80efa7289ef102a61a52dc5527fda4"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "c88d4808e1148a1fa457244be6485d39804243f8d41edf6e8f2a6400b527cf7e"
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
