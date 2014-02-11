require 'nico/listener'
require 'nico/responder'

module Nico
  extend self

  def say(message)
    @responses.say message
  end

  def show_board
    say "#{@cells[0]}#{@cells[1]}#{@cells[2]}"
    say "#{@cells[3]}#{@cells[4]}#{@cells[5]}"
    say "#{@cells[6]}#{@cells[7]}#{@cells[8]}"
  end

  def rows
    [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  end

  def winning_move?(move)
    rows.select{|row| row.include? move}.any? do |row|
      row.map{|index| @cells[index]}.uniq.size == 1
    end
  end

  def run(options = {})
    requests = Listener.new options[:room_id], options[:token]
    @responses = Responder.new options[:subdomain], options[:room_id], options[:token]
    @cells = [':one:', ':two:', ':three:', ':four:', ':five:', ':six:', ':seven:', ':eight:', ':nine:']
    users = [nil] * 2
    current_user = 0
    say "To play, type 'play N' on your turn. For instance: play 3"
    show_board

    requests.each_message do |request|
      if request['type'] == "TextMessage"
        case request['body']
        when /^play (?<cell>[1-9])$/
          index = $~[:cell].to_i - 1
          unless [':x:', ':o:'].include? @cells[index]
            if users[current_user].nil? && !users.include?(request['user_id'])
              users[current_user] = request['user_id']
            end
            if users[current_user] == request['user_id']
              marker = current_user.zero? ? ':x:' : ':o:'
              @cells[index] = marker
              current_user = (current_user + 1) % 2
              show_board
              if @cells.all?{|cell| [':x:', ':o:'].include? cell}
                say 'It’s a tie!'
                exit
              elsif winning_move?(index)
                say "#{marker} wins!"
                exit
              end
            end
          end
        end
      end
    end
  end
end