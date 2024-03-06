require 'fileutils'

class SourceKafkaAT12 < Formula
  v = "v1.2.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "ec016bbc097ebe785e2b997cf3da0cd3ee26c41f36876a9251dace08c9ea418d"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "a886b9fb4dfacd13beaeba6dae322e99f0c569dff90fccc13f95891c67754c90"
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
