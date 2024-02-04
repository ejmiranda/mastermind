# frozen_string_literal: true

require_relative 'player'
require_relative 'comp_player'
require_relative 'input'
require_relative 'output'

# A 2-Player turn-based game
class Game
  include Input
  include Output
end
