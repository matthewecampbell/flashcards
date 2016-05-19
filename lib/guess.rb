# This file will hold the user's guess
# and attach it to the card that was guessed upon.

class Guess
  # This method will allow us to see the response and the card in our Round class.
  attr_reader       :response,
                    :card

  def initialize(response, card)
    @response       = response.upcase
    @card           = card
  end

  # Check to see if the user's guess is correct.
  def correct?
    @response == card.answer
  end
  # This method gives feedback based on the user's guess.
  def feedback
    if @response == card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end
end
