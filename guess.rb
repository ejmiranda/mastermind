# frozen_string_literal: true

# A single guess and its feedback from the Mastermind game
class Guess
  attr_reader :id
  attr_accessor :comb, :feedback

  def initialize(id: 0, comb: %i[W W W W], feedback: %i[black black black black])
    @id = id
    @comb = comb
    @feedback = feedback
  end
end
