require 'fileutils'

class AdminAT14 < Formula
  v = "v1.4.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "2136187294314e4167ae8f226ea1ccd03e0b7980635aa0cce70178516def9d66"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "68d4609b42faf163a1e9cd6592f99c4fefe857d580dbc6e89329f70acfec6998"
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
