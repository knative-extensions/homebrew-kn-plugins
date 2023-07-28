require 'fileutils'

class Admin < Formula
  v = "v1.11.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "e0f4fd38135d399b9b51b073e7a3e15b7428e6d1a3b6e03effaf95c0df23753d"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "36a88a7f4d488ba2b7046087997429d406570b342d6f6797c4703f608cc243f6"
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
