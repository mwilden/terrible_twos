# coding: UTF-8
require 'forwardable'
require_relative 'terrible_twos'
require_relative 'board'

class Drill
  include Enumerable
  extend Forwardable
  def_delegator :@boards, :each

  def initialize starting_letter = 'A', ending_letter = 'Z'
    create_boards starting_letter, ending_letter
  end

  def create_boards starting_letter, ending_letter
    @boards = []
    for letter in starting_letter..ending_letter
      create_board "#{letter} ", starting_letter, ending_letter
      create_board " #{letter}", starting_letter, ending_letter
    end
    @boards.shuffle!
  end

  def create_board board_string, starting_letter, ending_letter
    board = Board.new board_string, starting_letter, ending_letter
    return unless board.has_any_moves?
    @boards << board
  end

end
