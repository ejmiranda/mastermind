# frozen_string_literal: true

require_relative 'guess'
require 'colorize'

# A board for the Mastermind Game
class Board
  def initialize(row_qty: 12, guess: Guess.new(%i[W W W W], %i[W W W W]))
    @guesses = Array.new(row_qty, guess)
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

  def print_board # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    guesses.reverse.each_with_index do |guess, idx|
      puts
      print "#{guesses.length - idx}  "
      print '● '.colorize(guess.feedback[0])
      print '● '.colorize(guess.feedback[1])
      guess.comb.each do |i|
        print "#{COLORS[i]} "
      end
      puts
      print '   ● '.colorize(guess.feedback[2])
      print '● '.colorize(guess.feedback[3])
      puts
    end
  end
end
