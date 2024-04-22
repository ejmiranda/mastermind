# frozen_string_literal: true

require_relative 'player'
require_relative 'guesser'

# A single computer player of a game
class CompPlayer < Player
  attr_reader :guesser

  def initialize
    super(name: 'Comp')
    @guesser = Guesser.new
  end
end
