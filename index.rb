# frozen_string_literal: true

require_relative './lib/board'

chess = Board.new(5, 5)
chess.display_cords
chess.display_board