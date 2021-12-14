require 'fileutils'

class Quickstart < Formula
  v = "v1.1.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "d2c6751fb89fce79242d24ebf5b690e379744422f3ef7f6846c5c103337b6edb"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "40577e624d0c15cd43ed6e72fa7764518f97640cf01794cb4c1b669193bb5b29"
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

