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

  describe 'question number'
    it 'each question should have a sequential question number'
      #drill = Drill.new
      #drill.entries[0].number.should == 1
      #drill.entries[1].number.should == 2
    #end
  #end

  describe 're-asking missed questions'
    it 'should ask a missed question twice again'
      #drill = Drill.new
      #question = drill.entries.first
      #drill.entries.select {|entry| entry.to_s == question.to_s}.size.should == 1
      #drill.ask_twice_again_later(question)
      #drill.entries.select {|entry| entry.to_s == question.to_s}.size.should == 3

end
