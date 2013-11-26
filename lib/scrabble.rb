# coding: UTF-8
require_relative 'terrible_twos'
require_relative 'two_letter_word'

class Scrabble
  def self.two_letter_words
    @_two_letter_words ||= [
      TwoLetterWord.new('AA', 'lava'),
      TwoLetterWord.new('AB', 'muscle'),
    ]
  end

  def self.find_two_letter_word string
    two_letter_words.find do |two_letter_word|
      two_letter_word.word == string
    end
  end

end
