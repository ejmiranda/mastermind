# frozen_string_literal: true

# Output related methods
module Output
  def print_banner(text:)
    puts
    puts '----------------------'
    puts text.upcase
    puts '----------------------'
    puts
  end

  def print_separator
    puts '----------------------'
    puts
  end
end
