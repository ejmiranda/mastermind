# frozen_string_literal: true

require_relative 'player'
require_relative 'smarts'

# A single computer player of a game
class CompPlayer < Player
  include Smarts
  def initialize
    super(name: 'Comp')
  end
end
