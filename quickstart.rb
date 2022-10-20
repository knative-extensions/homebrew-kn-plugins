require 'fileutils'

class Quickstart < Formula
  v = "v1.8.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "d908c8d2fcc9c2f39bc412ac77a3c938dab13f0e89fddb95c360848f3870673e"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "cff33e2e6566017c2522aa2fbd25c60b15c1d41270c4ba92e7701096f0e0b888"
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

