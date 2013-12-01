# coding: UTF-8
require_relative '../lib/terrible_twos'
require_relative 'view'

class Controller
  def initialize drill
    @drill = drill
  end

  def run
    View.show_banner
    run_drill
  end

  def run_drill
    for board in @drill.boards
      @board = board
      @view = View.new board
      @view.show_board

      loop do
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
    when response == '!' then handle_show_all_words
    else handle_move response
    end
  end

  def handle_move response
    move = @board.find response
    if move
      if @board.has_played? move
        handle_duplicate_move
      else
        handle_correct_move move
      end
    else
      handle_incorrect_move
    end
  end

  def handle_show_all_words
    @view.show_all_words
  end

  def handle_give_up
    @view.show_board_statistics
    @view.show_unplayed_moves
    GiveUp
  end

  def handle_correct_move move
    @board.record_correct_move move
    if @board.no_moves_left?
      return handle_no_more_moves move
    else
      @view.show_correct_move move
      @view.show_moves_left
      @view.show_board
    end
    Correct
  end

  def handle_no_more_moves move
    @view.show_correct_move move
    @view.puts
    @view.show_unplayed_moves
    @view.show_board_statistics
    NoMoreMoves
  end

  def handle_incorrect_move
    @board.record_incorrect_move
    @view.show_incorrect_move
    @view.show_board
    Incorrect
  end

  def handle_duplicate_move
    @board.record_duplicate_move
    @view.show_duplicate_move
    @view.show_board
    Duplicate
  end

end
