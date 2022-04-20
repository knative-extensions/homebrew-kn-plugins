require 'fileutils'

class SourceKafka < Formula
  v = "v1.4.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "76642eb192de0bd94c7930bea305843468d8d53fef1fcb50229f32dab027bff0"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "fde22ad7e5ecd9d1417e1c554a45a0c072d588f3320b74ad005e8f96bd115d37"
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
