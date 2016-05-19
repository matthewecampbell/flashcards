# Allows me to start flashcards with cards loaded from text file.

require_relative './lib/card'
require_relative './lib/guess'
require_relative './lib/deck'
require_relative './lib/round'
require_relative './lib/card_generator'
require 'pry'

# Building cards to put in a deck to put in a round.
cards = CardGenerator.new('cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)

#Starting the round in the terminal.
round.start
