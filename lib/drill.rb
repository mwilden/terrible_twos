class Drill
  include Enumerable
  extend Forwardable
  def_delegator :@questions, :each
  attr_reader :correct_answers, :incorrect_answers

  def initialize
    @questions = create_questions
    @correct_answers = @incorrect_answers = 0
  end

  def valid? answer
    true
  end

  def record is_correct
    is_correct ? @correct_answers += 1 : @incorrect_answers += 1
  end

  def total_answers
    @correct_answers + @incorrect_answers
  end

  def correct_percent
    return 0 if total_answers.zero?
    (@correct_answers.to_f / total_answers * 100).round
  end

  def record_correct_answer
  end

  def record_incorrect_answer
  end

  private
  def create_questions
    @questions = []
    @questions << Question.new('AA', 'lava')
    @questions << Question.new('AB', 'muscle')
  end

end
