require 'fileutils'

class SourceKafka < Formula
  v = "v1.8.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "4a90ee09c084b67dcc3c922cba4c8874159f81a487287c1cbd60fe735ecdd310"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "ffc64513e34ed5330b52d087bdfc56da814ceb1d11d471c811fd9a85f45597df"
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
