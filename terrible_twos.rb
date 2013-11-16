require_relative 'controller'
require_relative 'view'

class TestTwos
  def initialize
    @drill = Drill.new
    @view = View.new @drill
    @controller = Controller.new @drill, @view
  end

  def run
    @controller.run
  end

end

TestTwos.new.run
