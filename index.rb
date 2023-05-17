# frozen_string_literal: true

require_relative './lib/board'

chess = Board.new(0, 1)
chess.display_cords
chess.display_board
chess.display_knight
