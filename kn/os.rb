require 'rbconfig'

module Kn

class OS
  def self.mac?
    /darwin/i.match(RbConfig::CONFIG['host_os'])
  end
end

end