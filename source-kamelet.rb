require 'fileutils'

class SourceKamelet < Formula
  v = "v0.26.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "6de5854bf15762775c3f920fc08529ccbb6b498161c544e62e3d843625d1286f"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "24f42bdb5625ae012418dd57350bcfac29577ca7f667c72b02dd95669b7c15c5"
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
