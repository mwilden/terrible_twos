# coding: UTF-8
require_relative 'terrible_twos'
require_relative 'scrabble'

class Board
  attr_reader :moves

  def initialize string, first_letter = 'A', last_letter = 'Z'
    @string = string
    @moves = []
    make_moves first_letter, last_letter
  end

  def make_moves first_letter, last_letter
    for letter in first_letter..last_letter
      two_letter_word_string = @string.gsub /_/, letter
      two_letter_word = Scrabble.find_two_letter_word two_letter_word_string
      @moves << two_letter_word if two_letter_word
    end
    @moves.uniq!
  end

  def has_moves?
    !@moves.empty?
  end

  def inspect
    string = super
    for move in @moves
      string << move.inspect
    end
    string
  end

end

