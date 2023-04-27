require 'fileutils'

class SourceKameletAT19 < Formula
  v = "v1.9.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "53337b7c326cce700a984188f794169231387b29ce777c7ff790d3d0ec70b554"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "00c0b172a014a775aa7b97abef7f97717ae92441b8fea34ef37c09657adfb0f3"
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
