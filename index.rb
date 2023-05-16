# frozen_string_literal: true

require_relative './lib/board'

chess = Board.new(0, 0)
chess.display_cords
chess.display_board
chess.display_knight
