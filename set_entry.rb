# frozen_string_literal: true

# A single entry in a Guesser set
class SetEntry
  attr_accessor :comb, :used, :available

  def initialize(comb: %i[W W W W], used: false, available: true)
    @comb = comb
    @used = used
    @available = available
  end
end
