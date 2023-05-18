# frozen_string_literal: true

require_relative './lib/board'

def knight_moves(current, target)
  x = current[0]
  y = current[1]
  chess = Board.new(x, y)
  chess.display_cords
  chess.display_board
  chess.shortest_target_space(target)
end

knight_moves([3, 3], [4, 3])
