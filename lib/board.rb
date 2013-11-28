# coding: UTF-8
require_relative 'terrible_twos'
require_relative 'scrabble'

class Board
  attr_reader :moves, :string

  def initialize string, first_letter = 'A', last_letter = 'Z'
    @string = string
    @moves = create_moves first_letter, last_letter
  end

  def create_moves first_letter, last_letter
    moves = []
    for letter in first_letter..last_letter
      two_letter_word_string = @string.gsub /_/, letter
      two_letter_word = Scrabble.find_two_letter_word two_letter_word_string
      moves << two_letter_word if two_letter_word
    end
    moves
  end

  def has_any_moves?
    !@moves.nil? && !@moves.empty?
  end

  def has_move? two_letter_word
    @moves.find two_letter_word
  end

  def find letter
    string = @string.gsub /_/, letter
    @moves.find do |move|
      move.word == string
    end
  end

  def move_count
    @moves.count
  end

end
