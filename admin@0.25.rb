require 'fileutils'

class AdminAT025 < Formula
  v = "v0.25.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "42fa937b3e9255fc7bd0187211b28ee4081b20f5c5c2031d468c6ab8bb085089"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "fced1d9a3a2775637e8997ba01bd21782176caac3fc7d2556cc68c593cd3dc86"
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
