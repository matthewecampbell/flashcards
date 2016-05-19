# Allows me to start flashcards with cards loaded from text file.

require_relative './lib/card'
require_relative './lib/guess'
require_relative './lib/deck'
require_relative './lib/round'
require_relative './lib/card_generator'
require 'pry'
# Building cards to put in a deck to put in a round.
# extension - Let the user pick a deck
puts "Please enter a deck you wish to study."
puts "nfl_teams"
puts "cards"
input = gets.chomp
if File.exists?("#{input}.txt")
  # If the file exists, create the cards and start the round.
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
