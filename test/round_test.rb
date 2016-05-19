require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/guess'
require_relative '../lib/deck'
require_relative '../lib/round'
require 'pry'

class RoundTest < Minitest::Test

attr_reader :card_1, :card_2, :deck, :round

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([card_1, card_2])
    @round = Round.new(deck)
  end

    def test_can_create_round
      assert_instance_of Deck, round.deck
      assert_equal [], round.guesses
    end

    def test_current_card
      assert_equal card_1, round.current_card
    end

    def test_can_record_guess
      assert_equal "JUNEAU", round.record_guess("Juneau").response
      assert_instance_of Guess, round.record_guess("Juneau")
    end

    def test_can_count_guesses_and_give_feedback
      round.record_guess("Juneau")
      assert_equal 1, round.guesses.count
      assert_equal "Correct!", round.guesses.first.feedback
    end

    def test_number_of_correct_cards_in_round
      round.record_guess("Juneau")
      round.move_to_next_card
      assert_equal 1, round.number_correct
    end

    def test_if_can_move_to_next_card
      round.record_guess("Juneau")
      round.move_to_next_card
      assert_equal card_2, round.current_card
    end

    def test_can_make_second_guess
      round.record_guess("Juneau")
      round.move_to_next_card
      assert_equal card_2, round.current_card
      assert_equal 1, round.number_correct
    end

    def test_can_record_second_guess
      round.record_guess("Juneau")
      round.move_to_next_card
      assert_equal card_2, round.current_card
      assert_equal 1, round.number_correct
      guess = round.record_guess("2")
      refute guess.correct?
    end

    def test_can_record_number_of_guesses
      round.record_guess("Juneau")
      round.move_to_next_card
      assert_equal card_2, round.current_card
      round.record_guess("2")
      round.move_to_next_card
      assert_equal 2, round.number_guesses
    end

    def test_can_record_percent_correct
      round.record_guess("Juneau")
      round.move_to_next_card
      assert_equal card_2, round.current_card
      round.record_guess("2")
      round.move_to_next_card
      assert_equal 50, round.percent_correct
    end

    def test_incorrect_card_back_of_deck
      round.record_guess("Anchorage")
      round.move_to_next_card
      assert_equal 3, round.total_cards
    end

    def test_if_downcase_does_not_matter
      assert_equal "Correct!", round.record_guess("juneau").feedback
    end

    def test_if_upcase_does_not_matter
      assert_equal "Correct!", round.record_guess("JUNEAU").feedback
    end
  end
