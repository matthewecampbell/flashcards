class Card

attr_reader         :question, :answer

def initialize(question, answer)
  @question = question
  @answer = answer
end

def question
  @question
end

def answer
  @answer
end


end
