# This Deck class will be able to hold Cards in an array.

class Deck
# This method will allow us access to the array of cards in other files.
attr_reader       :cards

def initialize(cards)
  @cards = cards
end

def count
  @cards.count
end
end
