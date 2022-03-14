require 'fileutils'

class SourceKafka < Formula
  v = "v1.3.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "2d08ca4214a0e8019a57eec841ca893844e0b22e8f28e082523ca568ba696d77"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "b99301ef858040fd50a7a6a326cc5f363ba943a4a9e9798c44e266be57aaa3d4"
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
