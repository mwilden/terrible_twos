# coding: UTF-8
require 'forwardable'
require_relative 'terrible_twos'
require_relative 'board'

class Drill
  include Enumerable
  extend Forwardable
  attr_reader :boards
  def_delegator :@boards, :each

  def initialize starting_letter = 'A', ending_letter = 'Z', board = nil
    @boards = []
    if board.nil?
      create_boards starting_letter, ending_letter
    else
      create_board board, starting_letter, ending_letter
    end
    @boards.shuffle!
  end

  def create_boards starting_letter, ending_letter
    for letter in starting_letter..ending_letter
      create_board "#{letter} ", starting_letter, ending_letter
      create_board " #{letter}", starting_letter, ending_letter
    end
  end

  def create_board board_string, starting_letter, ending_letter
    board = Board.new board_string, starting_letter, ending_letter
    return unless board.has_any_moves?
    @boards << board
  end

end
