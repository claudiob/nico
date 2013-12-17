require 'nico/room/listener'
require 'nico/room/responder'

module Nico
  class Room
    def initialize(subdomain, id, token)
      @requests = Listener.new id, token
      @responses = Responder.new subdomain, id, token
    end

    def listen
      @requests.each{|request| yield self, request}
    end

    def respond_with(response)
      @responses.push response
    end
  end
end