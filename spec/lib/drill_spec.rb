require_relative '../spec_helper'
require_relative '../../lib/drill'

describe Drill do
  describe "Making a board" do
    it "should not make a board if there are no moves for it" do
      Drill.new('A', 'B').create_board('T_', 'B', 'C').should be_nil
    end
    it "should make a board if there are moves for it" do
      drill = Drill.new 'A', 'B'
      drill.clear_boards
      board = drill.create_board 'A_', 'A', 'B'
      drill.boards.should == [board]
    end
  end
end
