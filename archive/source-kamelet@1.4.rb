require 'fileutils'

class SourceKameletAT14 < Formula
  v = "v1.4.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "212f8276da3ad2638e42bad02f0e70f75ddceaab64ab1cf072162c473ae9807d"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "b9acebd9e05002b93be9e374abaf978bd0ece9107d9545f6ca79091ef51e68dc"
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
