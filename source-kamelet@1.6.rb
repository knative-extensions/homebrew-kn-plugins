require 'fileutils'

class SourceKameletAT16 < Formula
  v = "v1.6.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "76f1eb044955c5348364165e72d4ebd2bea8c81cc1c0ca6807fad9786c1a094e"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "7c45895ddae5a5d64c6aec6f7254427213b58fc916971086f2b4b4fa7b480eaa"
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
