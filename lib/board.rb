# frozen_string_literal: true

require_relative 'space'

# Board class
class Board
  attr_accessor :board, :knight

  def initialize(x_cord, y_cord)
    raise ArgumentError if x_cord > 7 || x_cord.negative?
    raise ArgumentError if y_cord > 7 || y_cord.negative?

    @board = Array.new(8) { |i| Array.new(8) { |j| Space.new([i, j]) } }
    @knight = board[x_cord][y_cord]
  end

  def display_cords
    board.each do |row|
      row.each do |space|
        print space.position
      end
      puts
    end
  end

  def display_knight
    p knight.position
  end

  def display_board
    board.each do |row|
      row.each do |space|
        print '[K]' if space == knight
        print '[ ]' unless space == knight
      end
      puts
    end
  end
end
