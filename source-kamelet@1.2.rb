require 'fileutils'

class SourceKameletAT12 < Formula
  v = "v1.2.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "207775accf07e52e9cbe9e053e545a1891e838447184d9491047d3c309997ad8"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "27d4b3200f955f61adcd107842df287bbefd7dcd404b04fefebbea8981e6a41a"
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
