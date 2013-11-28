require_relative 'terrible_twos'

class TwoLetterWord
  attr_reader :word, :definition

  def initialize word, definition
    @word, @definition = word, definition
  end

end
