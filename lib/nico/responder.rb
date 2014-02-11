require 'json'

module Nico
  class Responder
    def initialize(subdomain, id, token)
      @http = Net::HTTP.new "#{subdomain}.campfirenow.com", 443
      @http.use_ssl = true
      @request = Net::HTTP::Post.new "/room/#{id}/speak.json"
      @request.basic_auth token, 'x'
      @request['Content-Type'] = 'application/json'
    end

    def say(message)
      @request.body = {message: {body: message}}.to_json
      @http.request @request
    end
  end
end