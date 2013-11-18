require 'spec_helper'

describe Drill do
  describe 'recording and reporting results' do
    it 'should tally the number of right and wrong answers and give the percent' do
      drill = Drill.new
      drill.record_correct_answer
      drill.record_incorrect_answer
      drill.record_correct_answer
      drill.correct_answer_count.should == 2
      drill.incorrect_answer_count.should == 1
      drill.total_answer_count.should == 3
      drill.correct_percent.should == 67
    end
  end

end
