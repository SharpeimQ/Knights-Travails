# frozen_string_literal: true

require_relative 'node'
require_relative 'knight'

# Board class
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8, 0) }
  end

  def display_board
    board.each_with_index { |_, i| p board[i] }
  end
end
