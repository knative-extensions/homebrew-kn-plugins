require 'fileutils'

class AdminAT10 < Formula
  v = "v1.0.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a911d42877c89f61b724906ccd2de1bf58289c71cf87c53c15122e23cdae1e7f"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "ab2ca3d2ea9cde5db632c20dd209c88f13d73de282e442d4482fcf34c478f2de"
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
