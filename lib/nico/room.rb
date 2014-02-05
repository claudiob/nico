require 'nico/room/listener'
require 'nico/room/responder'

module Nico
  class Room
    def initialize(options = {})
      @requests = Listener.new options[:room_id], options[:token]
      @responses = Responder.new options[:subdomain], options[:room_id], options[:token]
    end

    def listen
      @requests.each{|request| yield self, request}
    end

    def each_message
      @requests.each{|request| yield request.body}
    end

    def respond_with(response)
      @responses.push response
    end
    alias :say :respond_with
  end
end