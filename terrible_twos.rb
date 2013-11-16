require_relative 'app/controller'
require_relative 'app/view'

class TerribleTwos
  def initialize
    @drill = Drill.new
    @view = View.new @drill
    @controller = Controller.new @drill, @view
  end

  def run
    @controller.run
  end

end

TerribleTwos.new.run
