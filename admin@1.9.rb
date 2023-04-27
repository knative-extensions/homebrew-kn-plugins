require 'fileutils'

class AdminAT19 < Formula
  v = "v1.9.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "bf1bd44f07dba416932c4478340c6f736d3d35a685e8d1251dd8d0c54a9cd03e"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "a0a00b1f17e42e168c53d2c4a8ab389a4f6231ddd9653647729a27602a542819"
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
