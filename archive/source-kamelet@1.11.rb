require 'fileutils'

class SourceKameletAT111 < Formula
  v = "v1.11.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "3b9e3070d7f20f915bbd1a57c69abdd97e8f41177e2f66cbf7a0d03349ecd558"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "6ac36f61d08d20d41bdf6a49244c3c388951e3a02f03d2e5dad75b452efd30eb"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-source-kamelet-darwin-amd64", "kn-source-kamelet")
    else
      FileUtils.mv("kn-source-kamelet-linux-amd64", "kn-source-kamelet")
    end
    bin.install "kn-source-kamelet"
  end

  test do
    system "#{bin}/kn-source-kamelet", "version"
  end
end
