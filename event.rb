require 'fileutils'
require 'json'

require_relative 'kn/os'
require_relative 'kn/checksums'

class Event < Formula
  v = 'v1.1.1'
  plugin_name = 'event'
  org = 'knative-sandbox'
  repo = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/#{org}/#{repo}/releases/download/knative-#{v}"
  arch = 'amd64'
  os = if Kn::OS.mac? then 'darwin' else 'linux' end
  source_bin = "kn-event-#{os}-#{arch}"
  target_bin = 'kn-event'
  checksums = Kn::Checksums.new(org, repo, v)

  homepage "https://github.com/#{org}/#{repo}"

  version v
  url "#{base_url}/#{file_name}-#{os}-#{arch}"
  sha256 checksums.digest(os, arch)

  def install
    FileUtils.mv(source_bin, target_bin)
    bin.install target_bin
  end

  test do
    json = shell_output("#{bin}/#{target_bin} version -o json").strip
    version_info = JSON.parse(json)
    assert_equal v, version_info['version']
  end
end
