require_relative 'lib/terrible_twos'
require_relative 'view'

class Controller
  def initialize drill, view
    puts $:
    @drill, @view = drill, view
  end

  def run
    @view.show_initial
    @drill.each do |question|
      break unless answer question
    end
    @view.show_report
  end

  def answer question
    loop do
      @view.ask question
      answer = @view.get_answer
      case
      when answer == :quit then return false
      when answer == :help then @view.show_help(question)
      when question.correct?(answer) then return true
      else @view.show_help_for_incorrect_answer(question)
      end
    end
  end

end
