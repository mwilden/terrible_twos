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
      @view.show_board board

      while true
        response = gets.chomp.upcase
        response_type = handle_response board, response
        break if [NoMoreMoves, GiveUp].include? response_type
      end
    end
  end

  NoMoreMoves = 1
  Incorrect   = 2
  Correct     = 3
  Duplicate   = 4
  GiveUp      = 5

  def handle_response board, response
    case
    when response == '~' then exit
    when response == '?' then handle_give_up board
    else handle_move board, response
    end
  end

  def handle_move board, response
    move = board.find response
    if move
      if board.played_moves.include? move
        handle_duplicate_move board
      else
        handle_correct_move board, move
      end
    else
      handle_incorrect_move board
    end
  end

  def handle_give_up board
    string = "Answered #{board.played_moves.count} out of #{board.correct_moves.count}. "
    string << "The rest of the moves were: "
    move_strings = []
    for move in board.moves
      unless board.moves_played.include? move
        move_strings << "#{move.word} (#{move.definition})"
      end
    end
    string += move_strings.join(', ') + '.'
    puts string
    GiveUp
  end

  def handle_correct_move board, move
    string = "Correct. #{move.word}: #{move.definition}."
    board.record_correct_move move
    if board.played_moves.size == board.move_count
      return handle_no_more_moves board
    else
      moves_left_count = board.moves_left_count
      string << " #{moves_left_count} #{pluralize 'move', moves_left_count} left."
      puts string
      @view.show_board board
    end
    Correct
  end

  def handle_no_more_moves board
    @view.show_board_statistics board
    NoMoreMoves
  end

  def handle_incorrect_move board
    puts "Incorrect."
    board.record_incorrect_move
    @view.show_board board
    Incorrect
  end

  def handle_duplicate_move board
    puts "Already played."
    board.record_duplicate_move
    @view.show_board board
    Duplicate
  end

  def pluralize root, count
    string = root
    string << 's' if count != 1
    string
  end
end
