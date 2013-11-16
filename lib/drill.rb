class Drill
  include Enumerable
  extend Forwardable
  def_delegator :@questions, :each
  attr_reader :correct_answers, :wrong_answers

  def initialize
    @questions = create_questions
    @correct_answers = @wrong_answers = 0
  end

  def record is_correct
    is_correct ? @correct_answers += 1 : @wrong_answers += 1
  end

  def total_answers
    @correct_answers + @wrong_answers
  end

  def correct_percent
    return 0 if total_answers.zero?
    (@correct_answers.to_f / total_answers * 100).round
  end

  def ask_twice_again_later question
    insert_after = @questions.index(question)
    2.times do
      insert_before = entries.size
      insert_at = rand(insert_before - insert_after) + insert_after + 1
      @questions.insert(insert_at, question)
    end
  end

  private
  def create_questions
    []
  end

end
