
require_relative './lib/card'
require_relative './lib/guess'
require_relative './lib/deck'
require_relative './lib/round'
require_relative './lib/card_generator'
require 'pry'

if File.exists?("#{ARGV[-1]}")
  cards = CardGenerator.new("#{ARGV[-1]}").cards
  deck = Deck.new(cards)
  round = Round.new(deck)
  round.start
end

puts "Please enter a deck you wish to study."
puts "nfl_teams"
puts "cards"
input = gets.chomp
if File.exists?("#{input}.txt")
  cards = CardGenerator.new("#{input}.txt").cards
  deck = Deck.new(cards)
  round = Round.new(deck)
  round.start
else
  until File.exists?("#{input}.txt")
  puts "That file does not exist.  Please choose nfl_teams or cards"
  input = gets.chomp
  end
  cards = CardGenerator.new("#{input}.txt").cards
  deck = Deck.new(cards)
  round = Round.new(deck)
  round.start
end
