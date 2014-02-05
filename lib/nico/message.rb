require 'nico/aliases'
require 'nico/matchers/daft_punk_matcher'

module Nico
  class Message
    attr_reader :body

    def initialize(json)
      # also available: id, user_id, starred, created_at, type, room_id
      @body = json['body'] || ''
    end

    def relevant?
      @body.start_with? *Nico::ALIASES
    end

    def response
      # This should loop through the regex and respond adequately
      # And one of these regex will add to the regex (and save to github)
      case @body
        when Matchers::DaftPunkMatcher.match then Matchers::DaftPunkMatcher.response
        else "You said #{@body}"
      end
    end
  end
end