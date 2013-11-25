require_relative 'two_letter_word'
class Question
  attr_reader :two_letter_word, :definition

  def self.create_questions word, definition
    Question.new word
    Question.new
  end

  def initialize two_letter_word, definition
    @two_letter_word, @definition = two_letter_word, definition
  end

  def correct? answer
    true
  end
end

