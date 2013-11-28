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
      puts
      @moves = []
      @incorrect_move_count = 0
      @duplicate_move_count = 0
      show_board board
      while true
        response = gets.chomp.upcase
        response_response = handle_response board, response
        break if [NoMoreMoves, GiveUp].include? response_response
      end
    end
  end

  def handle_response board, response
    if response == '?'
      return handle_give_up board
    end

    if response == '~'
      exit
    end

    move = board.find response
    if move
      if @moves.include? move
        handle_duplicate_move board
      else
        handle_correct_move board, move
      end
    else
      handle_incorrect_move board
    end
  end

  NoMoreMoves = 1
  Incorrect = 2
  Correct = 3
  Duplicate = 4
  GiveUp = 5

  def handle_give_up board
    string = "Answered #{@moves.count} out of #{board.moves.count}. "
    string << "The rest of the moves were: "
    move_strings = []
    for move in board.moves
      unless @moves.include? move
        move_strings << "#{move.word} (#{move.definition})"
      end
    end
    string += move_strings.join(', ') + '.'
    puts string
    GiveUp
  end

  def handle_correct_move board, move
    string = "Correct. #{move.word}: #{move.definition}."
    @moves << move
    if @moves.size == board.move_count
      return handle_no_more_moves board
    else
      moves_left_count = board.moves.count - @moves.count
      string << " #{moves_left_count} #{pluralize 'move', moves_left_count} left."
      puts string
      show_board board
    end
    Correct
  end

  def handle_no_more_moves board
    show_board_statistics board
    NoMoreMoves
  end

  def handle_incorrect_move board
    puts "Incorrect."
    @incorrect_move_count += 1
    show_board board
    Incorrect
  end

  def handle_duplicate_move board
    puts "Already played."
    @duplicate_move_count += 1
    show_board board
    Duplicate
  end

  def show_board board
    @view.show_board board
  end

  def show_board_statistics board
    string = "#{board.moves.size} possible moves. #{@incorrect_move_count} incorrect moves."
    string << " #{@duplicate_move_count} #{pluralize('duplicate', duplicate_move_count)}." if @duplicate_move_count > 0
    puts string
  end

  def pluralize root, count
    string = root
    string << 's' if count != 1
    string
  end
end
