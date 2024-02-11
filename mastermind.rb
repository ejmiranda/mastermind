# frozen_string_literal: true

require_relative 'game'
require_relative 'guess'
require 'colorize'

# The classic code breaking game
class Mastermind < Game
  def initialize
    @human = Player.new
    @comp = CompPlayer.new
    super(game: 'Mastermind', players: [@human, @comp])
  end

  def start
    play_game
  end

  private

  attr_reader :human, :comp

  COLORS = {
    blue: '🔵',
    green: '🟢',
    yellow: '🟡',
    orange: '🟠',
    purple: '🟤',
    red: '🔴',
    white: '⚪'
  }.freeze

  def play_game
    super
    set_human_name
    loop do
      play_round
      break unless play_again?

      print_separator
    end
    print_banner(text: 'Thank you for playing!')
  end

  def set_human_name
    puts "What's your name?"
    human.name = gets.chomp
    print_separator
  end

  def play_round
    set_human_id
  end

  def set_human_id
    human.id = get_valid_value(
      prompt: "#{human.name}, are you a codemaker (1) or a codebreaker (2)?",
      valid_values: %w[1 2],
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: false
    )
    print_separator
  end
end
