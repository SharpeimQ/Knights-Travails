# frozen_string_literal: true

require_relative 'space'
require 'set'

# Board class
class Board
  attr_accessor :board, :knight, :length

  def initialize(x_cord, y_cord)
    arg_error(y_cord, x_cord)

    @length = 7
    @board = Array.new(8) { |i| Array.new(8) { |j| Space.new([j, length - i]) } }
    @knight = board[length - y_cord][x_cord]
    @knight_moves = k_moves(knight.position)
  end

  def k_moves(position)
    move_offsets = {
      [-2, 1] => true, [-1, 2] => true, [1, 2] => true, [2, 1] => true,
      [2, -1] => true, [1, -2] => true, [-1, -2] => true, [-2, -1] => true
    }
    k_moves_h(move_offsets, position)
  end

  def k_moves_h(hash, position)
    moves = []

    hash.each_key do |key|
      x = key[0] + position[0]
      y = key[1] + position[1]

      moves << Space.new([x, y]) if x.between?(0, 7) && y.between?(0, 7)
    end
    knight.moves = moves
  end

  def get_pointer(position)
    board[position[0]][position[1]]
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
    p knight.moves
  end

  def display_board
    board.each do |row|
      row.each do |space|
        display_board_h(space)
      end
      puts
    end
  end

  def display_board_h(space)
    if space == knight
      print '[K]'
    elsif knight.moves.any? { |move| move.position == space.position }
      print '[M]'
    else
      print '[ ]'
    end
  end

  def shortest_target_space(target)
    result = shortest_target_space_h(target, knight)

    puts "The Knight can move to #{target} in #{result.size - 2} Moves!"
    p result
  end

  def shortest_target_space_h(target, position = knight)
    return nil if position.moves.nil?

    queue = [position]
    visited = Set.new([position])
    path = {}

    until queue.empty?
      current = queue.shift
      current.moves = k_moves(current.position)

      return reconstruct_path(path, current) if current.position == target

      current.moves.each do |move|
        unless visited.include?(move)
          visited.add(move)
          path[move] = current
          queue << move
        end
      end
    end
  end

  def reconstruct_path(path, space)
    path_list = []
    while space != knight
      path_list.unshift(space.position)
      space = path[space]
    end
    path_list.unshift(knight.position)
  end

  def target_space(target)
    result = target_space_h(target, knight)

    puts "The Knight can move to #{target} in #{result.size - 2} Moves!"
    p result
  end

  def target_space_h(target, position = knight)
    return nil if position.moves.nil?

    queue = [position]
    result = []

    until queue.empty?
      position = queue.first
      position.moves = k_moves(position.position)

      result << queue.position

      if position.moves.any? { |move| move.position == target }
        result << target
        return result.map(&:position)
      elsif knight.moves
        queue.concat(position.moves)
      end

      queue.shift
      queue = queue.uniq(&:position)
    end
  end
end
