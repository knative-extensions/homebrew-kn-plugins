require 'fileutils'
require_relative './plugins_helper'

class SourceKafka < Formula
  v = "0.22.0"
  plugin_name = "source-kafka"

  plugins_helper = PluginsHelper.new(plugin_name, v)

  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/v#{v}"

  homepage plugins_helper.repo()

  version "v#{v}"

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 plugins_helper.sha('darwin-amd64')
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 plugins_helper.sha('linux-amd64')
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
    system "#{bin}/kn-source-kafka", "help"
  end
end
