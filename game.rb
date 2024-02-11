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

  def play_game
    print_banner(text: "Welcome to #{game}")
  end

  def play_again?
    get_valid_value(
      prompt: 'Do you want to play again (Y/N)?',
      valid_values: %w[Y N],
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    ) == 'Y'
  end
end
