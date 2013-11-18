require_relative '../lib/terrible_twos'
require_relative 'view'

class Controller
  def initialize drill, view
    @drill, @view = drill, view
  end

  def run
    @view.show_banner
    run_drill
    @view.show_statistics
  end

  def run_drill
    @drill.each do |question|
      answer question
    end
  end

  def answer question
    @view.ask question
    loop do
      answer = @view.get_answer
      if !valid? answer
        handle_invalid_answer answer
      else
        if question.correct? answer
          handle_correct_answer
        else
          @drill.record_incorrect_answer
          @view.show_correct_answer question
        end
        handle_after_answer question
        break
      end
    end
  end

  def valid? answer
    @drill.valid? answer
  end

  def handle_invalid_answer answer
    @view.show_not_a_letter_message answer
  end

  def handle_correct_answer
    @drill.record_correct_answer
  end

  def handle_incorrect_answer
    @drill.record_incorrect_answer
  end

  def handle_after_answer question
    @view.show_definition question
    @view.show_statistics
  end

end
