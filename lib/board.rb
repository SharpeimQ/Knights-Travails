# frozen_string_literal: true

require_relative 'space'

# Board class
class Board
  attr_accessor :board, :knight, :length

  def initialize(x_cord, y_cord)
    arg_error(y_cord, x_cord)

    @length = 7
    @board = Array.new(8) { |i| Array.new(8) { |j| Space.new([j, length - i]) } }
    @knight = board[length - y_cord][x_cord]
  end

  def arg_error(first, second)
    raise ArgumentError if first > 7 || first.negative?
    raise ArgumentError if second > 7 || second.negative?
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
    p knight
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
