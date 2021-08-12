require 'fileutils'

class AdminAT024 < Formula
  v = "v0.24.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "0a7e0a523ce7800e3459f5ed010aa392f293be55e2c664f2a23f76aafb5fbae4"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "ce3e123e6fdf9ea31bd861f3ed82261da48b6fc8d43bd3e57430b3e33063c16b"
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
