# frozen_string_literal: true

require_relative 'game'
require_relative 'guess'
require 'colorize'

# A 2-Player turn-based game
class Mastermind < Game

   # 🔵🟢🟡🟠🟤🔴⚪
  COLORS = {
    blue:   "🔵",
    green:  "🟢",
    yellow: "🟡",
    orange: "🟠",
    purple: "🟤",
    red:    "🔴",
    white:  "⚪"
  }.freeze

  def start
    play_game
  end

  private

  def play_game
    guesses = [Guess.new([:red, :green, :yellow, :orange], [:red, :white, :red, :white])]
    guesses.push Guess.new([:red, :blue, :purple, :orange], [:red, :white, :red, :white])
    guesses.reverse.each_with_index do |guess, idx|
      puts
      print "#{guesses.length - idx}  "
      print "● ".colorize(guess.feedback[0])
      print "● ".colorize(guess.feedback[1])
      guess.comb.each do |i|
        print "#{COLORS[i]} "
      end
      puts
      print "   ● ".colorize(guess.feedback[2])
      print "● ".colorize(guess.feedback[3])
      puts
    end
  end

  def print_board
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
