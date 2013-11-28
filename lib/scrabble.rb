# coding: UTF-8
require_relative 'terrible_twos'
require_relative 'two_letter_word'

class Scrabble
  def self.two_letter_words
    @_two_letter_words ||= [
      TwoLetterWord.new('AA', 'lava'),
      TwoLetterWord.new('AB', 'muscle'),
      TwoLetterWord.new('AD', 'ad'),
      TwoLetterWord.new('AE', 'one'),
      TwoLetterWord.new('AG', 'agriculture'),
      TwoLetterWord.new('AH', 'interjection'),
      TwoLetterWord.new('AI', 'three-toed sloth'),
      TwoLetterWord.new('AL', 'East Indian tree'),
      TwoLetterWord.new('AM', 'to be'),
      TwoLetterWord.new('AN', 'indefinite article'),
      TwoLetterWord.new('AR', 'R'),
      TwoLetterWord.new('AS', 'to the same degree'),
      TwoLetterWord.new('AT', 'in the position of'),
      TwoLetterWord.new('AW', 'interjection'),
      TwoLetterWord.new('AX', 'ax'),
      TwoLetterWord.new('AY', 'aye'),
    ]
  end

  def self.find_two_letter_word string
    two_letter_words.find do |two_letter_word|
      two_letter_word.word == string
    end
  end

end
