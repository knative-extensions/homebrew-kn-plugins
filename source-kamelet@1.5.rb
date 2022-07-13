require 'fileutils'

class SourceKameletAT15 < Formula
  v = "v1.5.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "c080ce4d522eb39ea41e218cea00d60cc790b930078b1124761eb32a4dce3f82"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "5e9bb7b66129a35a0a878f716e61e64de782c1cd29ba01dddc920e9827b19120"
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
