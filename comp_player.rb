# frozen_string_literal: true

require_relative 'player'

# A single computer player of a game
class CompPlayer < Player
  def initialize
    super(name: 'Comp')
  end
end
