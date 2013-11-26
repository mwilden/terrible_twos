# coding: UTF-8
require 'forwardable'
require_relative 'terrible_twos'
require_relative 'board'

class Drill
  include Enumerable
  extend Forwardable
  def_delegator :@boards, :each
  attr_reader :correct_answer_count, :incorrect_answer_count

  def initialize
    @boards = create_boards
    @correct_answer_count = @incorrect_answer_count = 0
  end

  def valid? answer
    true
  end

  def record_correct_answer
    @correct_answer_count += 1
  end

  def record_incorrect_answer
    @incorrect_answer_count += 1
  end

  def total_answer_count
    @correct_answer_count + @incorrect_answer_count
  end

  def correct_percent
    return 0 if total_answer_count.zero?
    (@correct_answer_count.to_f / total_answer_count * 100).round
  end

  private
  def create_boards
    @boards = []
    for letter in 'A'..'B'
      create_board "#{letter}_"
      create_board "_#{letter}"
    end
    @boards
  end

  def create_board board_string
    board = Board.new board_string
    return unless board.has_moves?
    @boards << board
  end

end
