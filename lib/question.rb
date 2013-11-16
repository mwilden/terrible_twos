class Question
  attr_reader :number, :help

  def initialize drill, number
    @drill, @number = drill, number
    @action = nil
    @help = nil
  end

  def correct? answer
    is_correct = @action == answer
    @drill.ask_twice_again_later(self) unless is_correct
    unless @already_answered
      @drill.record is_correct
      @already_answered = true
    end
    is_correct
  end

end

