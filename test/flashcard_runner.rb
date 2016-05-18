require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/guess'
require_relative '../lib/deck'
require_relative '../lib/round'
require 'pry'

question_1    = Card.new("What is 5+5?", "10")
question_2    = Card.new("What is Rachel's favorite animal?", "PANDA")
question_3    = Card.new("What is Mike's middle name?", "nobody knows")
question_4    = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber")
turing_deck   = Deck.new([question_1, question_2, question_3, question_4])
round_1       = Round.new(turing_deck)

round_1.start
