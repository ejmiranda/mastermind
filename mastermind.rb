# frozen_string_literal: true

require_relative 'game'
require_relative 'board'
require_relative 'guess'

# The classic code breaking game
class Mastermind < Game # rubocop:disable Metrics/ClassLength
  def initialize
    @human = Player.new
    @comp = CompPlayer.new
    super(game: 'Mastermind', players: [@human, @comp])
    @board = Board.new(guess_qty: 12)
    @code = Guess.new
  end

  private

  attr_reader :human, :comp, :board, :code

  def play_game
    super
    set_players_names(player_qty: 1)
    loop do
      play_round
      break unless play_again?

      print_separator
    end
    end_game
  end

  def play_round # rubocop:disable Metrics/MethodLength
    set_human_id
    create_code
    board.guesses.each do |guess|
      play_turn(guess)
      if guessed?(guess)
        self.winner = human.id == '2' ? human : comp
        break
      end

      print_separator
    end
    print_separator
    end_round
  end

  def set_human_id
    human.id = get_valid_value(
      prompt: "#{human.name}, are you a codemaker (1) or a codebreaker (2)?",
      valid_values: %w[1 2],
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: false
    )
    self.winner = human.id == '1' ? human : comp
    print_separator
  end

  def create_code
    case human.id
    when '1' # Codemaker
      code.comb = create_guess.comb
      print_separator
    when '2' # Codebreaker
      # code.comb = board.random_comb
      code.comb = %i[B B B B]
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
  end

  def guessed?(guess)
    guess.feedback == Array.new(4, :red)
  end

  def end_round # rubocop:disable Metrics/AbcSize
    board.print_board
    winner.points += 1
    puts "\n\nThe WINNER of this round is #{winner.name.upcase}!\n\n"
    puts "#{human.name}: #{human.points}"
    puts "#{comp.name}: #{comp.points}"
    self.winner = nil
    print_separator
  end
end
