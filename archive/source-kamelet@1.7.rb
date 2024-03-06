require 'fileutils'

class SourceKameletAT17 < Formula
  v = "v1.7.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "f9468ea9a7e8056b55ac90627a32d7f4cef713baf4cee82dbde8a2d09c1c0806"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "397b4aaf0baf2a95c558e8f36eb8cbe067856e97f52850727fce777a95f07e7a"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-source-kamelet-darwin-amd64", "kn-source-kamelet")
    else
      FileUtils.mv("kn-source-kamelet-linux-amd64", "kn-source-kamelet")
    end
    bin.install "kn-source-kamelet"
  end

  test do
    system "#{bin}/kn-source-kamelet", "version"
  end
end
