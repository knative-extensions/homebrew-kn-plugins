require 'fileutils'

class SourceKafkaAT17 < Formula
  v = "v1.7.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "6b179afd45115b0fb2092fd289a94b6aa0b6f35954b3260ee9f65b8b9b6fdc66"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "09ee91a10b0ca32c93e0cc104726deb0d0e58c668e54e040f56e686a359323ab"
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
