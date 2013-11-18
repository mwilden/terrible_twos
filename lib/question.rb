class Question
  attr_reader :two_letter_word, :definition

  def initialize two_letter_word, definition
    @two_letter_word, @definition = two_letter_word, definition
  end

  def correct? answer
    true
  end
end

