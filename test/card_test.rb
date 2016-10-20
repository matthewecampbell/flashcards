require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require 'pry'

class CardTest < Minitest::Test

  def test_card_has_question_and_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert "What is the capital of Alaska?", card.question
    assert "Juneau", card.answer
  end
end
