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
    @comp.guesser.prepare_set(values: board.color_ids)
    @code = Guess.new(id: 99)
  end

  private

  attr_reader :human, :comp
  attr_accessor :board, :code

  def play_game
    super
    set_players_names(player_qty: 1)
    loop do
      play_round
      break unless play_again?

      set_screen
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

      set_screen
    end
    set_screen
    end_round
  end

  def set_human_id
    # human.id = get_valid_value(
    #   prompt: "#{human.name}, are you a codemaker (1) or a codebreaker (2)?",
    #   valid_values: %w[1 2],
    #   invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
    #   up_case: false
    # )
    human.id = '1'
    self.winner = human.id == '1' ? human : comp
    set_screen
  end

  def create_code
    case human.id
    when '1' # Codemaker
      # code.comb = create_guess.comb
      # code.comb = %i[B G Y O]
      code.comb = board.random_comb
      set_screen
    when '2' # Codebreaker
      code.comb = board.random_comb
    end
  end

  def create_guess(guess: Guess.new) # rubocop:disable Metrics/MethodLength
    puts "Create a 4 digit combination from these colors:\n\n"
    board.print_color_ops
    loop do
      guess.comb = select_color_comb
      puts "\n"
      board.print_comb(guess)
      break if get_yes(prompt: 'Do you want to keep your selection (Y/N)?')

      guess.comb = %i[W W W W]
      puts "\n"
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

  def play_turn(guess) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    # board.print_board
    board.print_board(code: code)
    puts "\n\nGuess # #{guess.id.to_s.colorize(:red)}\n\n"
    case human.id
    when '1' # Codemaker
      # guess.comb = board.random_comb
      guess.comb = comp.guesser.make_guess(id: guess.id)
      puts 'COMP is trying to break the code. Press ENTER...'
      gets.chomp
    when '2' # Codebreaker
      guess.comb = create_guess.comb
    end
    feedback(guess)
    comp.guesser.feedback(prev_guess: guess) if human.id == '2'
  end

  def feedback(guess)
    feedback = exact_matches_qty(guess) + color_matches_qty(guess)
    feedback.push(:black) until feedback.size == 4
    guess.feedback = feedback.shuffle
  end

  def exact_matches_qty(guess)
    exact_matches_qty = []
    code.comb.each_with_index { |c_color, idx| exact_matches_qty << :red if c_color == guess.comb[idx] }
    exact_matches_qty
  end

  def color_matches_qty(guess)
    color_matches_qty = []
    nem = non_exact_matches(guess)
    nem_code_count = count_array_elements(nem[:code])
    nem_guess_count = count_array_elements(nem[:guess])
    nem_code_count.each_key do |k|
      [nem_code_count[k], nem_guess_count[k]].min.times { color_matches_qty << :white } if nem_guess_count[k]
    end
    color_matches_qty
  end

  def non_exact_matches(guess)
    non_exact_matches = { code: [], guess: [] }
    code.comb.each_with_index do |c_color, idx|
      if c_color != guess.comb[idx]
        non_exact_matches[:code] << c_color
        non_exact_matches[:guess] << guess.comb[idx]
      end
    end
    non_exact_matches
  end

  def count_array_elements(arr)
    arr.each_with_object({}) do |entry, count|
      count[entry] = arr.count(entry)
    end
  end

  def guessed?(guess)
    guess.feedback == Array.new(4, :red)
  end

  def end_round
    board.print_board(code: code)
    winner.points += 1
    puts "\n\nThe WINNER of this ROUND is #{winner.name.upcase.colorize(:red)}!\n\n"
    print_score
    self.winner = nil
    self.board = Board.new(guess_qty: 12)
    self.code = Guess.new(id: 99)
  end

  def print_score
    puts "#{human.name}: #{human.points}"
    puts "#{comp.name}: #{comp.points}"
  end

  def end_game
    set_screen
    self.winner = human.points > comp.points ? human : comp
    puts "The WINNER of THE GAME is #{winner.name.upcase}!!!\n".colorize(:red)
    print_score
    super
  end
end
