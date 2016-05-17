require 'pry'

class Round

attr_reader         :card, :guesses

def initialize(deck)
  @deck             = deck
  @guesses          = []
  @card             = card
  @current_card     = 0
end

def deck
  @deck
end

def guesses
  @guesses
end

def current_card
  deck.cards[@current_card]
end

def record_guess(guess)
  @guesses.push(guess)
end

end
