# frozen_string_literal: true

# A single guess and its feedback from the Mastermind game
class Guess
  attr_accessor :comb, :feedback

  def initialize(comb = [], feedback = [])
    @comb = comb
    @feedback = feedback
  end
end
