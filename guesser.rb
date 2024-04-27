# frozen_string_literal: true

# A guesser engine for a player of Mastermind
class Guesser
  attr_accessor :set

  def initialize
    @set = {}
  end

  def prepare_set(values:, digits: 4)
    key = ('1' * digits).to_i
    slice_digit = values.length
    slice_step = 11 - slice_digit # Don't know what happens if values.length > 11
    values.repeated_permutation(digits) do |permutation|
      set[key] = permutation
      key += key.to_s.slice(-1) == slice_digit.to_s ? slice_step : 1
    end
  end

  def guess(id:)
    case id
    when 1
      print_set(10)
      # puts find_in_set(%i[B B Y O])
    end
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
