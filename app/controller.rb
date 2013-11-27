# coding: UTF-8
require_relative '../lib/terrible_twos'
require_relative 'view'

class Controller
  def initialize drill
    @drill, @view = drill, View.new
  end

  def run
    @view.show_banner
    run_drill
  end

  def run_drill
    for board in @drill.boards
      show_board board
    end
  end

  def show_boards
    for board in @drill.boards
      show_board board
    end
  end

  def show_board board
    @view.show_board board
  end

end
