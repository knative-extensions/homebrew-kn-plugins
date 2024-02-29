require 'fileutils'

class AdminAT12 < Formula
  v = "v1.2.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "f4f94cda09c8fcd21b0a7c8adf0d57ee0e56c7ac026e2fd07d0954ff9abdbee7"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "514e525cd2f6d55b14cf9f4dad97a0a3add932cd3b25f8249255d28773c5c0e7"
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
