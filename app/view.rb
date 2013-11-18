require_relative '../lib/terrible_twos'

class View
  def initialize drill
    @drill = drill
  end

  def show_banner
    puts 'Terrible Twos 0.1 (18 Nov 2013] by Mark Wilden'
  end

  def ask question
    print "#{question.number} #{question} "
  end

  def get_answer
    gets.chomp
  end

  def show_not_a_letter_message answer
    puts 'not a letter'
  end

  def show_correct_answer question
    puts "correct answer here"
  end

  def show_definition question
    puts "definition"
  end

  def show_statistics
    puts "Final results: #{@drill.correct_percent}% #{@drill.correct_answers}/#{@drill.total_answers}"
  end

end

