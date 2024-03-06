require 'fileutils'

class SourceKafkaAT11 < Formula
  v = "v1.1.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "271251c649c8e4b179500fdc278fd42d4d535e879e8f8a42ecb4d3764dc5ac34"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "e3d60a28522812cb820000dac3d5a2fe3c0b0ef36d8b0174f32be33965509262"
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
