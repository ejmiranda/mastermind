# frozen_string_literal: true

require_relative 'guess'
require 'colorize'

# A board for the Mastermind Game
class Board
  def initialize(guess_qty:)
    @guesses = []
    guess_qty.times { |g| @guesses.push(Guess.new(id: g + 1)) }
  end

  attr_accessor :guesses

  COLORS = {
    B: '🔵',
    G: '🟢',
    Y: '🟡',
    O: '🟠',
    P: '🟤',
    R: '🔴',
    W: '⚪'
  }.freeze

  def color_ids
    COLORS.except(:W).keys
  end

  def random_comb(digits: 4)
    comb = []
    digits.times { comb << color_ids.sample(1) }
    comb.flatten
  end

  def random_text
    random_comb.map(&:to_s).join
  end

  def print_color_ops
    COLORS.except(:W).each_value { |value| print "#{value} " }
    print '<- Available color options'
    puts
    COLORS.except(:W).each_key { |key| print "#{key}  " }
    puts "\n\n"
  end

  def print_comb_colors(guess)
    guess.comb.each { |color_id| print "#{COLORS[color_id]} " }
    print '<- Your combination' if guess.id.zero?
  end

  def print_comb_text(guess)
    guess.comb.each { |color_id| print "#{color_id}  " unless color_id == :W }
  end

  def print_comb(guess)
    print_comb_colors(guess)
    puts
    print_comb_text(guess)
    puts "\n\n"
  end

  def print_board(code: Guess.new(id: 99)) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    print 'CODE:  '
    print_comb_colors(code)
    print "\n       "
    print_comb_text(code)
    puts "\n\n"
    guesses.reverse.each_with_index do |guess, idx|
      puts unless idx.zero?
      print "#{guess.id} "
      print ' ' if guesses.length - idx < 10
      print "#{'●'.colorize(guess.feedback[0])} #{'●'.colorize(guess.feedback[1])} "
      print_comb_colors(guess)
      puts
      print "   #{'●'.colorize(guess.feedback[2])} #{'●'.colorize(guess.feedback[3])} "
      print_comb_text(guess)
      puts
    end
  end
end
