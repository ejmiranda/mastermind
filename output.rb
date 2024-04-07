# frozen_string_literal: true

# Output related methods
module Output
  def reprint(bannner_text:)
    system('clear')
    print_banner(text: bannner_text)
  end

  def print_banner(text:)
    line = Array.new(text.size + 10, '-').join
    # puts
    puts line
    puts "     #{text.upcase}"
    puts line
    puts
  end
end
