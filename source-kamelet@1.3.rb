require 'fileutils'

class SourceKameletAT13 < Formula
  v = "v1.3.1"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "1582be9120efd15ad7b6ffb0eac5abadd1310542fd181eb95caac32ab3c8bcff"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "7b2bd966c91a988e98cddd6290e49d1bddf2c4d1ec173198235611ee949dcb1e"
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
