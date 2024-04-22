# frozen_string_literal: true

# A guesser engine for a player of Mastermind
class Guesser
  attr_accessor :set

  def initialize
    @set = []
  end

  def prepare_set(values:, digits: 4)
    values.repeated_permutation(digits) { |permutation| set << permutation }
  end

  def guess(id:)
    puts "Guess ID: #{id}"
  end
end
