require 'fileutils'

class SourceKameletAT112 < Formula
  v = "v1.12.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "43b8864a9b0ed7bd23d6ad605f6356c292f87b8d97837b34459718d02bad4b49"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "2c2dbc8ba75682c0c10988072152a2a3b8b213111fc297b4235067a4bd4d6b53"
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
