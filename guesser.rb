# frozen_string_literal: true

require_relative 'set_entry'
require_relative 'guess'

# A guesser engine for a player of Mastermind
class Guesser
  attr_accessor :prev_guess
  attr_reader :set

  def initialize
    @set = {}
    @prev_guess = Guess.new
  end

  def create_set(values:, digits: 4)
    values.repeated_permutation(digits) do |permutation|
      key = key_from_permutation(permutation, values)
      set[key] = SetEntry.new(comb: permutation)
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
      combination(1122)
    else
      process_feedback
      combination(1134)
      # There are 15 possible scenarios.
    end
  end

  def combination(entry_key)
    set[entry_key].comb
  end

  def process_feedback
    puts prev_guess.feedback.tally
    gets.chomp
  end

  def print_set(max_row)
    row = 1
    set.each do |key, value|
      puts "#{key} -> #{value.comb}, used: #{value.used}, available: #{value.available}"
      row += 1
      break if row > max_row
    end
    puts 'Press ENTER to continue...'
    gets.chomp
  end
end
