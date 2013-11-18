require_relative '../lib/terrible_twos'
require_relative 'view'

class Controller
  def initialize drill, view
    @drill, @view = drill, view
  end

  def run
    @view.show_banner
    run_drill
    @view.show_results
  end

  def run_drill
    @drill.each do |question|
      break unless answer question
    end
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
