# frozen_string_literal: true

# A single guess and its feedback from the Mastermind game
class Guess
  attr_accessor :comb, :feedback

  def initialize(comb = %i[W W W W], feedback = %i[white white white white])
    @comb = comb
    @feedback = feedback
  end
end
