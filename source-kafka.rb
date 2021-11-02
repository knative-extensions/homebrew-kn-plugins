require 'fileutils'

class SourceKafka < Formula
  v = "v1.0.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "1b1d2f888b7bd77cbfba6a6aaea18d077dd21b220af7806b4a0ed838470d4ac8"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "42f5ec1a134f0bc525361de89e6702bf7a9e713edf70104f04ff47d9ae8b2276"
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
