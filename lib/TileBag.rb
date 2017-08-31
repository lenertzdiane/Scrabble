
module Scrabble
  class TileBag
    attr_reader :bag_of_tiles

    def initialize
      @bag_of_tiles = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E",
          "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I",
           "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N","N","N","N","N","O",
            "O","O","O","O","O","O","O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S","S","S","T", "T",
            "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]
    end

    def draw_tiles(num)
      num = num.to_i
      drawn_tiles = []
      shuffled = @bag_of_tiles.shuffle
      num.times do
        drawn_tiles << @bag_of_tiles[0]
        @bag_of_tiles[0].delete
      end
      return @bag_of_tiles
    end



  end

end
