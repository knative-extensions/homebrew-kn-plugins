require 'fileutils'

class Admin < Formula
  v = "v0.22.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "d1232dffcfaca518b77f54b6ce49b478b1e9409203acb9ea4a1cfe38194f5576"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "863ea33842f6ec32eaa6818f45554e1cb997731a52248d659c687c9d2ff00f23"
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
