# frozen_string_literal: true

# A guesser engine for a player of Mastermind
class Guesser
  attr_accessor :set

  def initialize
    @set = {}
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

  def guess(id:)
    case id
    when 1
      puts set[1111]
      puts set[1122]
      puts set[6666]
      gets.chomp
      # print_set(10_000)
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
