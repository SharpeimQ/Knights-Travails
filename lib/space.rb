# frozen_string_literal: true

# Space Class
class Space
  attr_accessor :position, :moves

  def initialize(position = nil)
    @position = position
    @moves = move_calc(position)
  end

  def move_calc(position)
    move_offsets = {
      [-2, 1] => true, [-1, 2] => true, [1, 2] => true, [2, 1] => true,
      [2, -1] => true, [1, -2] => true, [-1, -2] => true, [-2, -1] => true
    }
    move_calc_h(move_offsets, position)
  end

  def move_calc_h(hash, position)
    moves = []

    hash.each_key do |key|
      x = key[0] + position[0]
      y = key[1] + position[1]

      moves << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    moves
  end
end
