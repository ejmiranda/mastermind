# frozen_string_literal: true

# A set of methods for Comp Player to win at Mastermind.
module Smarts
  def create_set(values:, digits: 4)
    set = []
    values.repeated_permutation(digits) { |permutation| set << permutation }
    set
  end
end
