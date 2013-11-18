require_relative '../lib/terrible_twos'

class View
  def initialize drill
    @drill = drill
  end

  def show_banner
    puts 'Terrible Twos 0.1 (18 Nov 2013] by Mark Wilden'
  end

  def show_results
    puts "Final results: #{@drill.correct_percent}% #{@drill.correct_answers}/#{@drill.total_answers}"
  end

  def ask question
    print "#{question.number} #{question} "
  end

  def get_answer
    loop do
      case gets.chomp
      when 'q' then return :quit
      when 'r' then return :raise
      when 'c' then return :call
      when '?' then return :help
      when ''  then return :fold
      else print '? '
      end
    end
  end

  def show_help_for_incorrect_answer question
    print "*** "
    show_help(question)
  end

  def show_help question
    puts question.help
  end

end

