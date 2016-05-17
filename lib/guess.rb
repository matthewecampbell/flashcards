class Guess
attr_reader       :response

def initialize(response, card)
@response       = response
@card           = card
end

def card
  @card
end

def response
  @response
end

def correct?
  @response == card.answer
end

def feedback
  if @response == card.answer
    "Correct!"
  else
    "Incorrect."
  end
end

end
