require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/guess'
require_relative '../lib/deck'
require_relative '../lib/round'
require 'pry'

class RoundTest < Minitest::Test

    def test_can_create_round
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      assert_instance_of Deck, round.deck
      assert_equal [], round.guesses
    end

    def test_current_card
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      assert_equal card_1, round.current_card
    end

    def test_can_record_guess
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      assert_equal "Juneau", round.record_guess("Juneau")
      # why would I test for "Juneau"
    end

    def test_can_count_guesses_and_give_feedback
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      assert_equal 1, round.guesses.count
      assert_equal "Correct!", round.guesses.first.feedback
    end

    def test_number_of_correct_cards_in_round
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      assert_equal 1, round.number_correct
    end

    def test_number_of_correct_cards_in_round
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      assert_equal card_2, round.current_card
    end

    def test_can_make_second_guess
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      assert_equal card_2, round.current_card
      assert_equal 1, round.number_correct
    end

    def test_can_record_second_guess
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      assert_equal card_2, round.current_card
      round.number_correct
      assert_equal "2", round.record_guess("2")
    end

    def test_can_record_number_of_guesses
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      assert_equal card_2, round.current_card
      round.record_guess("2")
      assert_equal 2, round.number_guesses
    end

    def test_can_record_percent_correct
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      assert_equal card_2, round.current_card
      round.record_guess("2")
      assert_equal 50, round.percent_correct
    end



  end
