require 'fileutils'

class QuickstartAT113 < Formula
  v = "v1.13.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a813bef5dfc121527c6ebb6acb7e4d931fb08665b6d26964b05f630767c5f23e"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "855203552b0115c92fd37f801397df642972cbad6b523414b7845b5c097f695c"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-quickstart-darwin-amd64", "kn-quickstart")
    else
      FileUtils.mv("kn-quickstart-linux-amd64", "kn-quickstart")
    end
    bin.install "kn-quickstart"
  end

  test do
    system "#{bin}/kn-quickstart", "version"
  end
end

