require 'spec_helper'

describe Drill do
  describe 'recording and reporting results' do
    it 'should tally the number of right and wrong answers and give the percent' do
      drill = Drill.new
      drill.record true
      drill.record false
      drill.record true
      drill.correct_answers.should == 2
      drill.wrong_answers.should == 1
      drill.total_answers.should == 3
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
