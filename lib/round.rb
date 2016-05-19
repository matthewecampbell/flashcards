require 'pry'

class Round

  attr_reader         :card, :guesses, :deck, :number_correct, :total_cards, :number_guesses
  def initialize(deck)
    @deck             = deck
    @guesses          = []
    @card             = card
    @current_card     = 0
    @number_correct   = 0.0
    @number_guesses   = 0.0
    @total_cards      = deck.cards.count
    @current_guess    = 0
    @percent_correct  = percent_correct
  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(guess)
    new_guess = Guess.new(guess, current_card)
    @guesses << new_guess
    new_guess.correct? ? @number_correct += 1 : deck.cards << deck.cards[@current_card] && @total_cards += 1
    @current_card    += 1
    @number_guesses  +=1
    new_guess
  end

  def percent_correct
    @percent_correct = @number_correct / @number_guesses * 100
  end

  def increment_guess
    @current_guess += 1
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    deck.cards.each do |card|
      puts "--------------------------------------------"
      puts "This is card number #{@current_card + 1} out of #{@total_cards}."
      puts card.question
      response = gets.chomp
      record_guess(response)
      puts @guesses[@current_guess].feedback
      if @guesses[@current_guess].feedback == "Incorrect."
        puts "For extra practice we are adding this card to the back of the deck"
      end
      increment_guess
      percent_correct
      if @current_card != @total_cards
        puts "Flipping next card!"
        sleep(1)
      end
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct.to_i} guesses out of #{@total_cards} for a score of #{@percent_correct}%"
  end
end
