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
    sha256 "be35cd2acc28a44db23675aee934381cba74b4958f1889afe9f01d6935fc3bdc"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "377770176f92ab5d7fd0e0391160ff8a17c1e8cd61aedccc4619cca252e42c13"
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

