require 'nico/message'
require 'yajl/http_stream'

module Nico
  class Listener
    def initialize(id, token)
      @url = "http://#{token}:x@streaming.campfirenow.com/room/#{id}/live.json"
    end

    def each
      Yajl::HttpStream.get(URI.parse @url) do |json|
        yield Message.new(json)
      end
    end
  end
end