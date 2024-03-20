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
    @board = Board.new(guess_qty: 12)
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
    create_code
    board.guesses.each do |guess|
      play_turn(guess)
      break if winner?

      print_separator
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
    case human.id
    when '1'
      code.comb = create_guess.comb
      print_separator
    when '2'
      code.comb = board.random_comb
    end
  end

  def create_guess(guess: Guess.new) # rubocop:disable Metrics/MethodLength
    puts "Create a 4 digit combination from these colors:\n\n"
    loop do
      board.print_color_ops
      guess.comb = select_color_comb
      puts "\n"
      board.print_comb(guess)
      break if get_yes(prompt: 'Do you want to keep your selection (Y/N)?')

      guess.comb = %i[W W W W]
      print_separator
    end
    guess
  end

  def select_color_comb
    get_valid_value_comb(
      prompt: "Write your color combination (#{board.random_text}, #{board.random_text}, etc.)",
      valid_values: board.color_ids.map(&:to_s), # Array of Symbols -> Array of Strings
      length: 4,
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    ).split('').map(&:to_sym) # String -> Array of Strings -> Array of Symbols
  end

  def play_turn(guess)
    board.print_board
    puts "\n\nGuess ##{guess.id}\n\n"
    guess.comb = create_guess.comb
    guess_feedback(guess)
    print_separator
  end

  def guess_feedback(guess)
    feedback = Array.new(4, :black)
    guess.comb.each_with_index do |color, idx|
      if color == code.comb[idx]
        feedback[idx] = :red
        next
      end
      feedback[idx] = :white if code.comb.include?(color)
    end
    guess.feedback = feedback.shuffle
    # puts
    # print 'Guess:    '
    # p guess.comb
    # print 'Code:     '
    # p code.comb
    # print 'Feedback: '
    # p feedback
    # print 'Shuffled: '
    # p feedback.shuffle
  end

  def winner?
    false
  end
end
