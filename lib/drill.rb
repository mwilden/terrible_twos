class Drill
  include Enumerable
  extend Forwardable
  def_delegator :@questions, :each
  attr_reader :correct_answer_count, :incorrect_answer_count

  def initialize
    @questions = create_questions
    @correct_answer_count = @incorrect_answer_count = 0
  end

  def valid? answer
    true
  end

  def record_correct_answer
    @correct_answer_count += 1
  end

  def record_incorrect_answer
    @incorrect_answer_count += 1
  end

  def total_answer_count
    @correct_answer_count + @incorrect_answer_count
  end

  def correct_percent
    return 0 if total_answer_count.zero?
    (@correct_answer_count.to_f / total_answer_count * 100).round
  end

  private
  def create_questions
    @questions = []
    @questions << Question.new('AA', 'lava')
    @questions << Question.new('AB', 'muscle')
  end

end
