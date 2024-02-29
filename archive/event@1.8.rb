require 'fileutils'
require 'json'

require_relative 'kn/plugin/event'

class EventAT18 < Formula
  PLUGIN = Kn::Plugin::Event.new 'v1.8.0'
  
  homepage PLUGIN.homepage
  version PLUGIN.version
  url PLUGIN.url
  sha256 PLUGIN.sha256

  def install
    FileUtils.mv(PLUGIN.source_bin, PLUGIN.target_bin)
    bin.install PLUGIN.target_bin
  end

  test do
    json = shell_output("#{bin}/#{PLUGIN.target_bin} version -o json").strip
    version_info = JSON.parse(json)
    assert_equal PLUGIN.version, version_info['version']
  end
end
