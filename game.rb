# frozen_string_literal: true

require_relative 'player'
require_relative 'comp_player'
require_relative 'input'
require_relative 'output'

# Any terminal based game
class Game
  include Input
  include Output

  def initialize(game: '', players: [])
    @game = game
    @players = players
  end

  private

  attr_reader :game, :players
  attr_accessor :winner

  def play_game
    print_banner(text: "Welcome to #{game}")
  end

  def play_again?
    get_yes(prompt: 'Do you want to play again (Y/N)?')
  end
end

def end_game
  print_banner(text: 'Thank you for playing!')
end
