require_relative 'lib/terrible_twos'

class View
  def initialize drill
    @drill = drill
  end

  def show_initial
    puts "#{@drill.entries.size} hands"
    puts "c)all r)aise [check/fold]"
  end

  def ask question
    show_table question.position
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

  def show_report
    puts "#{@drill.correct_percent}% #{@drill.correct_answers}/#{@drill.total_answers}"
  end

  private
  def show_table position
    '1234567DSB'.each_byte do |char|
      print char.chr + ' '
    end
    puts
    (position - 1).times do
      print '- '
    end
    puts '^'
  end
end

