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
    @code = Guess.new(%i[W W W W], %i[W W W W])
  end

  def start
    play_game
  end

  private

  attr_reader :human, :comp, :code

  COLORS = {
    B: '🔵',
    G: '🟢',
    Y: '🟡',
    O: '🟠',
    P: '🟤',
    R: '🔴',
    W: '⚪'
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
    when '1' # Human is codemaker
      create_guess(code) # Human codemaker manually creates the code.
    else # Human is codebreaker
      code.comb = COLORS.keys.sample(4) # Comp codemaker gets a random code.
    end
    print_separator
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
    create_guess(code)
  end

  def create_guess(guess)
    loop do
      print_color_ops
      print_comb(guess)
      guess.comb = select_colors
      puts "\n"
      print_comb(guess)
      break if get_yes_no(prompt: 'Do you want to keep your selection (Y/N)?')

      guess.comb = %i[W W W W]
      print_separator
    end
  end

  def print_color_ops
    COLORS.except(:W).each_value { |value| print "#{value} " }
    puts
    COLORS.except(:W).each_key { |key| print "#{key[0].upcase}  " }
    puts "\n\n"
  end

  def print_comb(guess)
    guess.comb.each { |i| print "#{COLORS[i]} " }
    puts "\n\n"
  end

  def select_colors
    get_valid_value_comb(
      prompt: 'Write your color combination ("BGYO, RPOY, etc.)"',
      valid_values: %w[B G Y O P R],
      length: 4,
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    ).split('').map(&:to_sym) # String -.split-> Array of Strings -.map-> Array of Symbols
  end
end
