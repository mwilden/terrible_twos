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
      @board = board
      @view.show_board @board

      while true
        response = gets.chomp.upcase
        response_type = handle_response response
        break if [NoMoreMoves, GiveUp].include? response_type
      end
      @view.puts
    end
  end

  def get_response
    gets.chomp.upcase
  end

  NoMoreMoves = 1
  Incorrect   = 2
  Correct     = 3
  Duplicate   = 4
  GiveUp      = 5

  def handle_response response
    case
    when response == '~' then exit
    when response == '?' then handle_give_up
    else handle_move response
    end
  end

  def handle_move response
    move = @board.find response
    if move
      if @board.played_moves.include? move
        handle_duplicate_move
      else
        handle_correct_move move
      end
    else
      handle_incorrect_move
    end
  end

  def handle_give_up
    @view.show_board_statistics @board
    @view.show_unplayed_moves @board
    GiveUp
  end

  def handle_correct_move move
    @view.show_correct_move move
    @board.record_correct_move move
    if @board.played_moves.size == @board.move_count
      @view.puts
      return handle_no_more_moves
    else
      @view.show_moves_left @board
      @view.show_board @board
    end
    Correct
  end

  def handle_no_more_moves
    @view.show_board_statistics @board
    NoMoreMoves
  end

  def handle_incorrect_move
    @view.show_incorrect_move
    @board.record_incorrect_move
    @view.show_board @board
    Incorrect
  end

  def handle_duplicate_move
    @view.show_duplicate_move
    @board.record_duplicate_move
    @view.show_board @board
    Duplicate
  end

end
