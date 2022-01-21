require_relative '../os'
require_relative '../checksums'

module Kn
module Plugin

class Event
  attr_reader :version

  def initialize(version)
    @version = version
    
    @os = if Kn::OS.mac? then 'darwin' else 'linux' end
    @arch = 'amd64'
    @plugin_name = 'event'
    @org = 'knative-sandbox'
    @repo = "kn-plugin-#{@plugin_name}"
    @file_name = "kn-#{@plugin_name}"
    @base_url = "https://#{gh_host}/#{@org}/#{@repo}/releases/download/knative-#{@version}"
    @source_bin = "kn-event-#{@os}-#{@arch}"
    @target_bin = 'kn-event'

    @checksums = Kn::Checksums.new(@org, @repo, @version, gh_host: gh_host)
  end

  def homepage
    "https://#{gh_host}/#{org}/#{repo}"
  end

  def url
    "#{base_url}/#{file_name}-#{os}-#{arch}"
  end

  def sha256
    @checksums.digest(os, arch)
  end

  private

  attr_reader :os, :arch, :plugin_name, :org, :repo
  attr_reader :file_name, :base_url, :source_bin, :target_bin

  def gh_host
    ENV.fetch('GITHUB_HOST', 'github.com')
  end
end

end
end
