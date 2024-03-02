# frozen_string_literal: true

require_relative 'guess'
require 'colorize'

# A board for the Mastermind Game
class Board
  def initialize(row_qty: 12)
    @guesses = Array.new(row_qty, Guess.new)
  end

  attr_accessor :guesses

  COLORS = {
    B: '🔵',
    G: '🟢',
    Y: '🟡',
    O: '🟠',
    P: '🟤',
    W: '⚪'
  }.freeze

  def color_ids
    COLORS.except(:W).keys
  end

  def print_color_ops
    COLORS.except(:W).each_value { |value| print "#{value} " }
    puts
    COLORS.except(:W).each_key { |key| print "#{key}  " }
    puts "\n\n"
  end

  def print_comb(guess)
    guess.comb.each { |color_id| print "#{COLORS[color_id]} " }
    puts
    guess.comb.each { |color_id| print "#{color_id}  " }
    puts "\n\n"
  end

  def print_board # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    guesses.reverse.each_with_index do |guess, idx|
      puts
      print "#{guesses.length - idx} "
      print ' ' if guesses.length - idx < 10
      print "#{'●'.colorize(guess.feedback[0])} #{'●'.colorize(guess.feedback[1])} "
      guess.comb.each do |i|
        print "#{COLORS[i]} "
      end
      puts
      print "   #{'●'.colorize(guess.feedback[2])} #{'●'.colorize(guess.feedback[3])} "
      puts
    end
  end
end
