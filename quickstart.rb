require 'fileutils'

class Quickstart < Formula
  v = "v1.2.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "ef11efd0c21c0c27190492c75bd5c110b25b156e003e8a5b5789e41845226558"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "44c4098115a4552304376790a60d44a331758fb231543ee630915353b7052f69"
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

