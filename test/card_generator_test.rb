require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test

  def test_can_load_text_file
    card_generator = CardGenerator.new("../cards.txt")
    assert File.exists?("../cards.txt")
  end

  def test_can_create_cards_from_text_file
    card_generator = CardGenerator.new("../cards.txt")
    assert_equal 4, card_generator.cards.count
    assert_instance_of Card, card_generator.cards[1]
  end
end
