require 'pry'

class Round

attr_reader         :card, :guesses, :deck, :number_correct, :number_guesses
def initialize(deck)
  @deck             = deck
  @guesses          = []
  @card             = card
  @current_card     = 0
  @number_correct   = 0.0
  @number_guesses   = 0.0
end


def current_card
  deck.cards[@current_card]
end

def record_guess(guess)
  new_guess = Guess.new(guess, current_card)
  @guesses << new_guess
  if new_guess.correct?
    @number_correct += 1
  end
@current_card    += 1
@number_guesses  +=1
  guess
end

def percent_correct
  @number_correct / @number_guesses * 100
end


end
