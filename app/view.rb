require_relative '../lib/terrible_twos'

class View

  def show_banner
    puts 'Terrible Twos 0.1 (18 Nov 2013] by Mark Wilden'
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

  def show_statistics
    puts "#{@drill.correct_percent}% #{@drill.correct_answer_count}/#{@drill.total_answer_count}"
  end

end

