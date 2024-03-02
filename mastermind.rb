# frozen_string_literal: true

require_relative 'game'
require_relative 'board'
require_relative 'guess'

# The classic code breaking game
class Mastermind < Game
  def initialize
    @human = Player.new
    @comp = CompPlayer.new
    super(game: 'Mastermind', players: [@human, @comp])
    @board = Board.new(row_qty: 12)
    @code = Guess.new
  end

  def start
    play_game
  end

  private

  attr_reader :human, :comp, :board, :code

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
      code.comb = board.color_ids.sample(4) # Comp codemaker gets a random code.
      board.print_board
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
      board.print_color_ops
      guess.comb = select_color_comb
      puts "\n"
      board.print_comb(guess)
      break if get_yes_no(prompt: 'Do you want to keep your selection (Y/N)?')

      guess.comb = %i[W W W W]
      print_separator
    end
  end

  def select_color_comb
    get_valid_value_comb(
      prompt: 'Write your color combination ("BGYO, POYG, etc.)"',
      valid_values: board.color_ids.map(&:to_s), # Array of Symbols -> Array of Strings
      length: 4,
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    ).split('').map(&:to_sym) # String -> Array of Strings -> Array of Symbols
  end
end
