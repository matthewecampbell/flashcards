class Guess
  attr_reader       :response,
                    :card

  def initialize(response, card)
    @response       = response.upcase
    @card           = card
  end

  def correct?
    @response == card.answer
  end

  def feedback
    @response == card.answer ? "Correct!" : "Incorrect."
  end
end
