require 'fileutils'

class Admin < Formula
  v = "v1.6.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "db38f720aefd71eade2bec249d448365dd5911d97620b451e2b5bdf9e6ceacf0"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "74aead49212eef7e23a9265ab081a555c106a641921282ad1340575aab9c9379"
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
