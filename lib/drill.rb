# coding: UTF-8
require 'forwardable'
require_relative 'terrible_twos'
require_relative 'board'

class Drill
  include Enumerable
  extend Forwardable
  def_delegator :@boards, :each
  attr_reader :correct_answer_count, :incorrect_answer_count, :boards

  def initialize starting_letter = 'A', ending_letter = 'B'
    @boards = create_boards starting_letter, ending_letter
    @correct_answer_count = @incorrect_answer_count = 0
  end

  #def valid? answer
    #true
  #end

  #def record_correct_answer
    #@correct_answer_count += 1
  #end

  #def record_incorrect_answer
    #@incorrect_answer_count += 1
  #end

  #def total_answer_count
    #@correct_answer_count + @incorrect_answer_count
  #end

  #def correct_percent
    #return 0 if total_answer_count.zero?
    #(@correct_answer_count.to_f / total_answer_count * 100).round
  #end

  ######
  def create_boards starting_letter, ending_letter
    clear_boards
    for letter in starting_letter..ending_letter
      create_board "#{letter}_", starting_letter, ending_letter
      create_board "_#{letter}", starting_letter, ending_letter
    end
    @boards
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
