require 'fileutils'

class Admin < Formula
  v = "v1.3.1"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "d115a054fd15bb186deb0cd542bae8fc8a6b3cbbcfad4e47c394e9d04d8ed2bb"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "fb3525e26fdd14ba5dcbeb0a6c24cf7d73bff51213d42a726bbdb102bf3c16a5"
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
