require_relative './lib/card'
require_relative './lib/guess'
require_relative './lib/deck'
require_relative './lib/round'
require_relative './lib/card_generator'
require 'pry'


cards = CardGenerator.new('cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)


round.start
