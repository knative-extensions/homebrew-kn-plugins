require 'fileutils'

class SourceKameletAT113 < Formula
  v = "v1.13.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "5e62c59942a35de80725b0de07b246993fb40024e1327295fd4b81b7d011eb84"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "62bbde01fc949edc9f7ed41b69a0c7c3b1c10f9de5e4577754955e8de5eb9be4"
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
