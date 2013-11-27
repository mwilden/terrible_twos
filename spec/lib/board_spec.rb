require_relative '../spec_helper'
require_relative '../../lib/board'

describe Board do
  describe 'Creating boards' do
    it "should create 2 moves for 'A_'" do
      board = Board.new 'A_', 'A', 'B'
      board.moves.should == [
        Scrabble.find_two_letter_word('AA'),
        Scrabble.find_two_letter_word('AB'),
      ]
    end
    it "should create 2 moves for '_A'" do
      board = Board.new 'A_', 'A', 'B'
      board.moves.should == [
        Scrabble.find_two_letter_word('AA'),
        Scrabble.find_two_letter_word('AB'),
      ]
    end
  end

  describe "Being empty" do
    it "should consider an empty board to be one with no moves" do
      board = Board.new 'ZZ', 'A', 'B'
      board.should_not have_any_moves
    end
    it "should consider an nonempty board to be one with moves" do
      board = Board.new 'A_', 'A', 'B'
      board.should have_any_moves
    end
  end

end
