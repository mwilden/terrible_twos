# coding: UTF-8
require_relative '../lib/terrible_twos'
require_relative 'view'

class Controller
  def initialize drill
    @drill, @view = drill, View.new
  end

  def run
    @view.show_banner
    run_drill
  end

  def run_drill
    for board in @drill.boards
      show_board board
      @moves = []
      while true
        response = gets.chomp.upcase
        break if handle_response board, response
      end
    end
  end

  def handle_response board, response
    move = board.find response
    if move
      handle_correct_response board, move
    else
      handle_incorrect_response board
    end
    move
  end

  NoMoreMoves = 1
  Incorrect = 2
  Correct = 3

  def handle_correct_response board, move
    puts "Correct. #{move.word}: #{move.definition}"
    @moves << move
    if @moves.size == board.move_count
      return handle_no_more_moves board
    end
    Correct
  end

  def handle_no_more_moves board
    puts "All moves were found"
    show_board_statistics board
    NoMoreMoves
  end

  def handle_incorrect_response board
    puts "Incorrect"
    show_board board
    Incorrect
  end

  def show_board board
    @view.show_board board
  end

  def show_board_statistics board
  end

end
