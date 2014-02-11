alias :oldputs :puts
def puts(*args); end
require 'yajl/http_stream'
alias :puts :oldputs

module Nico
  class Listener
    def initialize(id, token)
      @url = "http://#{token}:x@streaming.campfirenow.com/room/#{id}/live.json"
    end

    def each_message
      Yajl::HttpStream.get(URI.parse @url) do |json|
        yield json
      end
    end
  end
end