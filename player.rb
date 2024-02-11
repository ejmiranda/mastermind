# frozen_string_literal: true

# A single player of a game
class Player
  attr_accessor :name, :id, :points

  def initialize(name = '', id = '', points = 0)
    @name = name
    @id = id
    @points = points
  end
end
