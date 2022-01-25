require 'net/http'

module Kn
module Net

class Downloader
  def self.get(uri)
    Downloader.new().get(uri)
  end

  def initialize(transport = ::Net::HTTP)
    @transport = transport
  end

  def get(uri, limit = 10)
    raise ArgumentError, 'too many HTTP redirects' if limit == 0
  
    response = @transport.get_response(URI(uri))
  
    case response
    when ::Net::HTTPSuccess then
      response.body
    when ::Net::HTTPRedirection then
      location = response['location']
      get(location, limit - 1)
    else
      raise ArgumentError, "unexpected HTTP response: #{response.inspect}"
    end
  end
end

end
end
