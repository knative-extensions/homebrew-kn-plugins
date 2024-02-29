require 'fileutils'

class AdminAT17 < Formula
  v = "v1.7.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "ef2dc7aaf46d9184d3be36bd7fe231a901eb99eff29de2cec3d38eafc8d0555a"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "b0fb79425f85d469e3afcce885e018f6fbba8b54aa6ea0c1932177a683dce5a9"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-admin-darwin-amd64", "kn-admin")
    else
      FileUtils.mv("kn-admin-linux-amd64", "kn-admin")
    end
    bin.install "kn-admin"
  end

  test do
    system "#{bin}/kn-admin", "version"
  end
end
