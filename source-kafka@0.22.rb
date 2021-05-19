require 'fileutils'

class SourceKafkaAT022 < Formula
  v = "v0.22.0"
  plugin_name = "source-kafka"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "9a410c2062a351f778fcf84a85909d50a886dfc5daeb5554a16b03db201ee83c"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "650136bb614910c38aa3c0e12321bba2fda1df321746ad4a1f53f3f5d2229096"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-source-kafka-darwin-amd64", "kn-source-kafka")
    else
      FileUtils.mv("kn-source-kafka-linux-amd64", "kn-source-kafka")
    end
    bin.install "kn-source-kafka"
  end

  test do
    system "#{bin}/kn-source-kafka", "version"
  end
end
