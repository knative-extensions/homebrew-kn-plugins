require 'fileutils'

class AdminAT023 < Formula
  v = "v0.23.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a2f300ed33eb8db1606172a47dd4546ff48a151ba7f671ad38a626a39dd3921b"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "8ca3d751aa788b79516f68f6c9821cd5f40226754f25ca7c9d9a8f5bbfd0c158"
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
