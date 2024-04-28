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

  def start
    play_game
  end

  private

  attr_reader :game, :players
  attr_accessor :winner

  def play_game
    set_screen
  end

  def set_screen
    reprint(bannner_text: game)
  end

  def set_players_names(player_qty: players.size)
    players.each_with_index do |player, idx|
      player.name = get_not_empty(
        prompt: "Enter the name for Player #{idx + 1}",
        invalid_msg: 'Sorry, you have to enter something. Please try again.'
      )
      # player.name = 'Edgar'
      break if player_qty == idx + 1

      puts
    end
    set_screen
  end

  def play_again?
    puts
    get_yes(prompt: 'Do you want to play again (Y/N)?')
  end
end

def end_game
  puts "\nTHANK YOU FOR PLAYING!!!\n\n"
  # print_banner(text: 'Thank you for playing!')
end
