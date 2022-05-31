require 'fileutils'

class Admin < Formula
  v = "v1.5.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "f2dae50e804f8234b4551c6ee4c1454ab002928496328c71768176d9f7315f22"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "af5a74a1e99c7eaf87f92c662cb01bf7aa73e0392b203e400a1aadb99c562811"
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
