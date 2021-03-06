require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :highest_scoring_word,
                :highest_word_score, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
      @total_score = 0
      @highest_scoring_word = nil
      @highest_word_score = 0
    end

    def play(word)
      if won? == false
        @plays << word
        @total_score += Scoring.score(word)
      else
        return false
      end
    end

    def highest_scoring_word
      @highest_scoring_word = Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      highest_scoring_word
      @highest_word_score = Scoring.score(@highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      tile_bag.draw_tiles(7 - @tiles.length).each do |tile|
        @tiles << tile
      end
    end

    private

    def won?
      if @total_score > 100
        return true
      else
        return false
      end
    end
  end
end
