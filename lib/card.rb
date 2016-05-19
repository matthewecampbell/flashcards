# This Card class will hold the question and answer.

class Card
  # Put these methods in so we can read the questions and answers in other files
  attr_reader         :question,
                      :answer,
                      :hint
  # Set arguments for cards so they always have a quesiton and answer
  def initialize(question, answer, hint = "")
    @question        = question
    @answer          = answer.upcase
    @hint            = hint
  end
end
