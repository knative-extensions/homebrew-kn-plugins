require 'fileutils'

class Admin < Formula
  v = "v1.15.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "2e306b8fe8be8e19d7ea886aa20903238b45dc69f3b4fb807c2d2151c84a06d9"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "5e4e45c9ddcb983b0ac3ba0e02e898a40ec3d7556001d7c942f79601fe78e6fe"
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
