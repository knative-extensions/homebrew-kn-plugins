require 'fileutils'

class SourceKamelet < Formula
  v = "knative-v1.0.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "3aa8f44857cc92ec1daabdd91808649164711b7b26cf5a55a218020c1a262933"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "49327b16978d8cca0deebfb2c89e738081c9b075c9d119f90f591affed50b116"
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
