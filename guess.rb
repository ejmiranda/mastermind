# frozen_string_literal: true

# A single guess and its feedback from the Mastermind game
class Guess
  attr_reader :id
  attr_accessor :comb, :feedback

  def initialize(id = 1, comb = %i[W W W W], feedback = %i[white white white white])
    @id = id
    @comb = comb
    @feedback = feedback
  end
end
