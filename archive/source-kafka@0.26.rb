require 'fileutils'

class SourceKafkaAT026 < Formula
  v = "v0.26.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "e3d7da774a8377d48ffe122632a2e62fac9cca136188ace269f9e3022f097d6b"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "88c8c36eac3f25874889471c6516c7da8e6e203f64b3c8244953e9d3ceaded44"
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
