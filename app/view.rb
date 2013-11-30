# coding: UTF-8
require_relative '../lib/terrible_twos'

class View

  def initialize board
    @board = board
  end

  def self.show_banner
    puts "Terrible Twos 1.0 [#{Time.now.strftime '%F'}] by Mark Wilden"
  end

  def show_board
    print @board.to_s
    print "\b"
    print "\b" if @board.to_s[0] == ' '
  end

  def show_unplayed_moves
    return '' if @board.no_moves_left?
    string = "The rest of the moves were: "
    move_strings = []
    for move in @board.correct_moves
      unless @board.played_moves.include? move
        move_strings << "#{move.word} (#{move.definition})"
      end
    end
    string << move_strings.join(', ') + '.'
    puts string
  end

  def show_board_statistics
    string = "#{@board.correct_played_move_count}/#{@board.correct_moves.size} possible moves. #{@board.incorrect_move_count} incorrect moves."
    string << " #{@board.duplicate_move_count} #{pluralize('duplicate', @board.duplicate_move_count)}." if @board.duplicate_move_count > 0
    puts string
  end

  def show_correct_move move
    print "Correct. #{move.word}: #{move.definition}."
  end

  def show_moves_left
    moves_left_count = @board.moves_left_count
    puts " #{moves_left_count} #{pluralize 'move', moves_left_count} left."
  end

  def puts string = ''
    Kernel.puts string
  end

  def show_incorrect_move
    puts "Incorrect."
  end

  def show_duplicate_move
    puts "Already played."
  end

  def pluralize root, count
    string = root
    string << 's' if count != 1
    string
  end

end

