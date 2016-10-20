require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require 'pry'

class GuessTest < Minitest::Test

  def test_if_answer_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Card, guess.card
    assert_equal "JUNEAU", guess.response
    assert true, guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_if_answer_2_is_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_instance_of Card, guess.card
    assert_equal "SATURN", guess.response
    refute guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end
end
