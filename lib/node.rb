# frozen_string_literal: true

# Node Class
class Node
  attr_accessor :data, :in, :out

  def initialize(data = nil, income = nil, outcome = nil)
    @data = data
    @in = income
    @out = outcome
  end
end
