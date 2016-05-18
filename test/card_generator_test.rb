require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/guess'
require_relative '../lib/deck'
require_relative '../lib/round'
require_relative '../lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test

  def test_can_load_text_file
    card_generator = CardGenerator.new("../cards.txt")
    assert File.exists?("../cards.txt")
  end


  def test_can_shovel_text_into_array_and_break_into_mulitiple_indexes
    card_generator = CardGenerator.new("../cards.txt")
    card_generator.shovel_text
    assert_instance_of Array, card_generator.deck
    assert_equal 4, card_generator.shovel_text.count
  end


end
