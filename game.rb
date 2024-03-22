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
    print_banner(text: "Welcome to #{game}")
  end

  def set_players_names(player_qty: players.size)
    players.each_with_index do |player, idx|
      puts "Enter the name for Player #{idx + 1}"
      # player.name = gets.chomp
      player.name = 'Edgar'
      puts player.name
      puts
      break if player_qty == idx + 1
    end
    print_separator
  end

  def play_again?
    get_yes(prompt: 'Do you want to play again (Y/N)?')
  end
end

def end_game
  print_banner(text: 'Thank you for playing!')
end
