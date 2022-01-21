require 'fileutils'
require 'json'

require_relative 'kn/plugin/event'

class Event < Formula
  v = 'v1.1.1'
  plugin = Kn::Plugin::Event.new(v)
  
  homepage plugin.homepage

  version plugin.version
  url plugin.url
  sha256 plugin.sha256

  def install
    FileUtils.mv(plugin.source_bin, plugin.target_bin)
    bin.install plugin.target_bin
  end

  test do
    json = shell_output("#{bin}/#{plugin.target_bin} version -o json").strip
    version_info = JSON.parse(json)
    assert_equal v, version_info['version']
  end
end
