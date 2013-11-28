# coding: UTF-8
require 'forwardable'
require_relative 'terrible_twos'
require_relative 'board'

class Drill
  include Enumerable
  extend Forwardable
  def_delegator :@boards, :each
  attr_reader :correct_answer_count, :incorrect_answer_count, :boards

  def initialize starting_letter = 'A', ending_letter = 'Z'
    create_boards starting_letter, ending_letter
    @correct_answer_count = @incorrect_answer_count = 0
  end


  ######
  def create_boards starting_letter, ending_letter
    clear_boards
    for letter in starting_letter..ending_letter
      create_board "#{letter}_", starting_letter, ending_letter
      create_board "_#{letter}", starting_letter, ending_letter
    end
    @boards.shuffle!
  end

  def create_board board_string, starting_letter, ending_letter
    board = Board.new board_string, starting_letter, ending_letter
    return unless board.has_any_moves?
    @boards << board
    board
  end

  def clear_boards
    @boards = []
  end

end
