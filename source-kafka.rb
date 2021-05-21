require 'fileutils'
require_relative './plugins_helper'

class SourceKafka < Formula
  v = "0.23.0"
  plugin_name = "source-kafka"

  plugins_helper = PluginsHelper.new(plugin_name, v)

  homepage plugins_helper.homepage()

  version "v#{v}"

  if OS.mac?
    url "#{plugins_helper.base_url()}/#{plugins_helper.file_name()}-darwin-amd64"
    sha256 plugins_helper.sha('darwin-amd64')
  else
    url "#{plugins_helper.base_url()}/#{plugins_helper.file_name()}-linux-amd64"
    sha256 plugins_helper.sha('linux-amd64')
  end

  def install
    if OS.mac?
      FileUtils.mv("#{plugins_helper.file_name()}-darwin-amd64", plugins_helper.file_name())
    else
      FileUtils.mv("#{plugins_helper.file_name()}-linux-amd64", plugins_helper.file_name())
    end
    bin.install plugins_helper.file_name()
  end

  test do
    system "#{bin}/#{plugins_helper.file_name()}", "help"
  end
end
