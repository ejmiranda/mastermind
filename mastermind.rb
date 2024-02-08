# frozen_string_literal: true

require_relative 'game'
require 'colorize'

# A 2-Player turn-based game
class Mastermind < Game
  def start
    puts
    # 🔵🟢🟡🟠🟤🔴⚪
    print "12 "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "11 "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "10 "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "9  "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "8  "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "7  "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "6  "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "5  "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "4  "
    print "● ".colorize(:gray)
    print "● ".colorize(:gray)
    print "⚪ ".colorize(:red)
    print "⚪ ".colorize(:blue)
    print "⚪ ".colorize(:yellow)
    print "⚪ ".colorize(:orange)
    puts
    print "   ● ".colorize(:gray)
    print "● ".colorize(:gray)
    puts
    puts
    print "3  "
    print "● ".colorize(:red)
    print "● ".colorize(:white)
    print "🔴 ".colorize(:red)
    print "🟢 ".colorize(:blue)
    print "🔵 ".colorize(:yellow)
    print "🟠 ".colorize(:orange)
    puts
    print "   ● ".colorize(:red)
    print "● ".colorize(:white)
    puts
    puts
    print "2  "
    print "● ".colorize(:red)
    print "● ".colorize(:white)
    print "🔴 ".colorize(:red)
    print "🟢 ".colorize(:blue)
    print "🔵 ".colorize(:yellow)
    print "🟠 ".colorize(:orange)
    puts
    print "   ● ".colorize(:red)
    print "● ".colorize(:white)
    puts
    puts
    print "1  "
    print "● ".colorize(:red)
    print "● ".colorize(:white)
    print "🔴 ".colorize(:red)
    print "🟢 ".colorize(:blue)
    print "🔵 ".colorize(:yellow)
    print "🟠 ".colorize(:orange)
    puts
    print "   ● ".colorize(:red)
    print "● ".colorize(:white)
    puts
  end
end
