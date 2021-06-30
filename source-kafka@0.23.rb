require 'fileutils'

class SourceKafkaAT023 < Formula
  v = "v0.23.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "32d4019f6287a4a6f0f153f6a4c02e824c49bb3077d8a35d58d5ec3410604814"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "128821b22bb9d89a874f8cf47f559c9a3380326d0afc28fdcc22987fb8bbc61f"
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
