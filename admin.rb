require 'fileutils'
require_relative './plugins_helper'

class Admin < Formula
  v = "0.22.0"
  plugin_name = "admin"
 
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
      FileUtils.mv("kn-admin-darwin-amd64", "kn-admin")
    else
      FileUtils.mv("kn-admin-linux-amd64", "kn-admin")
    end
    bin.install "kn-admin"
  end

  test do
    system "#{bin}/kn-admin", "version"
  end
end
