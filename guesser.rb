# frozen_string_literal: true

require_relative 'guess'

# A guesser engine for a player of Mastermind
class Guesser
  attr_accessor :prev_guess, :reduced_set
  attr_reader :set

  def initialize
    @set = {}
    @reduced_set = {}
    @prev_guess = Guess.new
  end

  def prepare_set(values:, digits: 4)
    values.repeated_permutation(digits) do |permutation|
      key = key_from_permutation(permutation, values)
      set[key] = permutation
    end
  end

  def key_from_permutation(permutation, values)
    key = ''
    permutation.each do |item|
      key += (values.index(item) + 1).to_s
    end
    key.to_i
  end

  def make_guess(id:)
    case id
    when 1
      set[1122]
    else
      set[1134]
      # 3 reds
      # 2 reds
      # 1 red
      # 4 whites
      # 3 whites
      # 2 whites
      # 1 white
      # 4 blacks
    end
  end

  def feedback(prev_guess:)
    self.prev_guess = prev_guess
    reduce_set
  end

  def reduce_set
    # Her you have to map set into reduced_set using a criteria from previous guess + feedback
  end

  def print_set(max_row)
    row = 1
    set.each do |key, value|
      puts "#{row} - #{key} #{value}"
      row += 1
      break if row > max_row
    end
  end

  def find_in_set(find_item)
    set.find_index { |item| item == find_item }
  end
end
