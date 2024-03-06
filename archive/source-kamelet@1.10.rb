require 'fileutils'

class SourceKameletAT110 < Formula
  v = "v1.10.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "435d16e73a1fc4825f767b02f31e155217741ffd614687c1f53eb9bd3ded6b61"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "6da394621488a6fb07226699a1ef485260b1bdb47415d5add3b7755a99e42133"
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
