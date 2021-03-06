require 'pry'

module Scrabble
  class Scoring
    attr_reader :word_score
    @scoring_hash = { A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1,
      R: 1, S: 1, T: 1, D: 2, G: 2, B: 3, C: 3,
      M: 3, P:3, F: 4, H: 4, V: 4, W: 4, Y: 4, K: 5,
      J: 8, X: 8, Q: 10, Z: 10
    }

    def initialize
    end


    def self.score(word)
      word_score = 0
      word_arr = word.upcase.split("")
      if word_arr.length == 7
        word_score += 50
      end
      word_arr.each do |letter|
        letter = letter.to_sym
        word_score += @scoring_hash[letter]
      end
      return word_score
    end

    def self.highest_score_from(array_of_words)
      highest_score = 0
      highest_score_word = nil

      array_of_words.each do |word|
        word_score = self.score(word)
        word = word.upcase
        if word_score > highest_score
          highest_score = word_score
          highest_score_word = word
        elsif word_score == highest_score
          if word.length < highest_score_word.length
            unless highest_score_word.length == 7
              highest_score_word = word
            end
          elsif word.length == 7 && highest_score_word.length != 7
            highest_score_word = word
          end
        end
      end
      return highest_score_word
    end
  end
end
