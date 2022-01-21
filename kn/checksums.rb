require_relative 'net/downloader'

module Kn

class Checksums
  def initialize(org, repo, version, 
    checksums_file = 'checksums.txt', gh_host = 'github.com')
    @org = org
    @repo = repo
    @version = version
    @checksums_file = checksums_file
    @gh_host = gh_host
  end

  def digest(os, arch)
    entry = entries.find { |e| e.match(os, arch) }
    entry.checksum
  end

  private

  def entries
    @entries ||= parse(download())
    @entries
  end

  def parse(contents)
    contents.split("\n").map do |line|
      checksum, binary = line.split(/\s+/)
      Kn::Checksums::Entry.new(checksum, binary)
    end
  end

  def download
    Kn::Net::Downloader.get("https://#{@gh_host}/#{@org}/#{@repo}" +
      "/releases/download/knative-#{@version}/#{@checksums_file}")
  end
end

class Checksums::Entry
  attr_reader :checksum

  def initialize(checksum, binary)
    @checksum = checksum
    @binary = binary
  end

  def match(os, arch)
    if m = /^.+-([a-z0-9]+)-([a-z0-9]+)$/.match(@binary)
      return m[1] == os && m[2] == arch
    end
    false
  end
end

end
