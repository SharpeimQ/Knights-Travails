# frozen_string_literal: true

# Space Class
class Space
  attr_accessor :position, :moves

  def initialize(position = nil, moves = [])
    @position = position
    @moves = moves
  end
end
