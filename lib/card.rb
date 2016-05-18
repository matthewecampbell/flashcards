class Card

attr_reader         :question, :answer

def initialize(question, answer)
  @question = question
  @answer = answer.upcase
end

end
