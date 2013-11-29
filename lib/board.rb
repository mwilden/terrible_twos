# coding: UTF-8
require_relative 'terrible_twos'
require_relative 'scrabble'

class Board
  attr_reader :played_moves, :correct_moves, :incorrect_move_count, :duplicate_move_count

  def initialize string, first_letter = 'A', last_letter = 'Z'
    @string = string
    @played_moves = []
    @incorrect_move_count = @duplicate_move_count = 0
    @correct_moves = create_moves first_letter, last_letter
  end

  def to_s
    @string
  end

  def moves_left_count
    @correct_moves.count - @played_moves.count
  end

  def record_correct_move move
    @played_moves << move
  end

  def record_incorrect_move
    @incorrect_move_count += 1
  end

  def record_duplicate_move
    @duplicate_move_count += 1
  end

  def create_moves first_letter, last_letter
    moves = []
    for letter in first_letter..last_letter
      two_letter_word_string = @string.gsub ' ', letter
      two_letter_word = Scrabble.find_two_letter_word two_letter_word_string
      moves << two_letter_word if two_letter_word
    end
    moves
  end

  def has_any_moves?
    !@correct_moves.nil? && !@correct_moves.empty?
  end

  def find letter
    string = @string.gsub ' ', letter
    @correct_moves.find do |move|
      move.word == string
    end
  end

end
