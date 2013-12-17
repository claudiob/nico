module Nico
  module Matchers
    class DaftPunkMatcher
      def self.match
        /what is your favorite daft punk/i
      end

      def self.response
        top = ['Daftendirekt ', 'WDPK ', 'Revolution ', 'Da ', 'Phoenix ', 'Fresh ', 'Around the ', 'Rollin\' & ', 'Teachers ', 'High ', 'Rock \'n ', 'Oh ', 'Burnin\' ', 'Indo silver ', 'Alive ', 'Funk ', 'One more ', 'Aero', 'Digital ', 'Harder, better, ', 'Crescen', 'Night', 'Super', 'High ', 'Something about ', 'Voyager', 'Veridis ', 'Short ', 'Face ', 'Human ', 'The prime time of ', 'Robot ', 'Steam ', 'Make ', 'The ', 'On/', 'Television rules ', 'Techno', 'Emo', 'Give life back to ', 'The game of ', 'Giorgio ', 'With', 'Instant ', 'Lose yourself to ', 'Touch', 'Get ', 'Beyond', 'Mother', 'Fragments of ', 'Doin\' it ', 'Contact']
        bottom = ['83.7 FM', '909', 'funk', 'world', 'scratchin\'', 'fidelity', 'roll', 'yeah', 'club', 'ad', 'time', 'dynamic', 'love', 'faster, stronger', 'dolls', 'vision', 'heroes', 'life', 'us', 'quo', 'circuit', 'to face', 'after all', 'your life', 'rock', 'machine', 'love', 'brainwasher', 'off', 'the nation', 'logic', 'tion', 'music', 'love', 'by Moroder', 'in', 'crush', 'dance', 'lucky', 'board', 'time', 'right']
        [top.sample, bottom.sample].join
      end
    end
  end
end