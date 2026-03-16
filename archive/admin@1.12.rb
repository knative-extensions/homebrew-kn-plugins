require 'fileutils'

class AdminAT112 < Formula
  v = "v1.12.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "b0406fa0cb17bb1f8784c93d123a0e185bb467471e314b801ba33c54c9f0c7f1"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "d2a1bd4fef5906af02e18ef97bfb1b03a7c7972805d72b9c55a1041d83dae2d5"
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
