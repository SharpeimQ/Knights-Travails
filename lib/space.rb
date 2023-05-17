# frozen_string_literal: true

require_relative 'board'

# Space Class
class Space
  attr_accessor :position, :moves

  def initialize(position = nil, moves = [])
    @position = position
    @moves = moves
  end
end
