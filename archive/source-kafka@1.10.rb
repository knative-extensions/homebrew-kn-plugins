require 'fileutils'

class SourceKafkaAT110 < Formula
  v = "v1.10.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a63f38f559422ca3407907dc7e157138a24e0087f34646e939342e6b25d657f3"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "a60b6f3458e151780343556aa8854ae39d441c4fc7de9d877f2709feed2a8f82"
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
