require 'fileutils'

class SourceKameletAT114 < Formula
  v = "v1.14.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "055db315e0c1ef326d57ef95ef4cc85cde056fc0d1c2289266d0c501e8c793f5"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "a995e7a1b6c0a0304e8ac1f645b53a31db465b52a48d91fa89db1b3bcfa30487"
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
