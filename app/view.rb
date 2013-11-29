# coding: UTF-8
require_relative '../lib/terrible_twos'

class View

  def show_banner
    puts "Terrible Twos 0.1 [#{Time.now.strftime '%F'}] by Mark Wilden"
  end

  def ask question
    print question.two_letter_word + ' '
  end

  def get_answer
    gets.chomp
  end

  def show_not_a_letter_message answer
    puts 'not a letter'
  end

  def show_correct_answer question
    puts question.two_letter_word
  end

  def show_definition question
    puts question.definition
  end

  def show_board board
    print board.string
    print ' '
  end

  def show_board_statistics board
    string = "#{board.correct_moves.size} possible moves. #{board.incorrect_move_count} incorrect moves."
    string << " #{board.duplicate_move_count} #{pluralize('duplicate', duplicate_move_count)}." if board.duplicate_move_count > 0
    puts string
    puts
  end

end

