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
    @code = Guess.new(%i[whi whi whi whi], %i[whi whi whi whi])
  end

  def start
    play_game
  end

  private

  attr_reader :human, :comp, :code

  COLORS = {
    blu: '🔵',
    gre: '🟢',
    yel: '🟡',
    ora: '🟠',
    pur: '🟤',
    red: '🔴',
    whi: '⚪'
  }.freeze

  def play_game
    super
    set_human_name
    loop do
      play_round
      break unless play_again?

      print_separator
    end
    end_game
  end

  def set_human_name
    puts "What's your name?"
    # human.name = gets.chomp
    human.name = 'Edgar'
    puts human.name
    print_separator
  end

  def play_round
    set_human_id
    case human.id
    when '1'
      create_code
    else
      puts 'Codebreaker'
    end
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

  def create_code
    print_color_ops
    puts "\n\n"
    code.comb.each { |i| print "#{COLORS[i]} " }
    puts "\n\n"
    set_color_sel
  end

  def print_color_ops
    COLORS.except(:whi).each_value { |value| print "#{value} " }
    puts
    COLORS.except(:whi).each_key { |key| print "#{key[0].upcase}  " }
  end

  def set_color_sel
    comb = get_valid_value_comb(
      prompt: 'Write your color combination ("BGYO, RPOY, etc.)"',
      valid_values: %w[B G Y O P R],
      length: 4,
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    ).split('')
    p comb
    print_separator
  end
end
