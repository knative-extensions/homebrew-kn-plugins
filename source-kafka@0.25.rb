require 'fileutils'

class SourceKafkaAT025 < Formula
  v = "v0.25.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "9f06d312ab9f61c738c08cb1a757173f565948cf33b24b1893ae98d779a70c17"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "b2859c81ab73e0c349f8101a54eab1468b8f5b8d2e993d14d665c7cad6c1a337"
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
