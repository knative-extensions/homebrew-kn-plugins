require 'fileutils'

class Quickstart < Formula
  v = "v1.12.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a24d2c076fe09a833f84dbee2d11a56a80eec80b9c82272b401d4c44a2c75c39"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "e2142e3c4cb5e59f5e40197bc7076d98f6ef77981945125c888680e71b84a9b0"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-quickstart-darwin-amd64", "kn-quickstart")
    else
      FileUtils.mv("kn-quickstart-linux-amd64", "kn-quickstart")
    end
    bin.install "kn-quickstart"
  end

  test do
    system "#{bin}/kn-quickstart", "version"
  end
end

