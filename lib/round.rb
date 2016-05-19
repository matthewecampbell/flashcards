require 'pry'

class Round

  attr_reader         :card,
                      :guesses,
                      :deck,
                      :number_correct,
                      :total_cards,
                      :number_guesses

  def initialize(deck)
    @deck             = deck
    @guesses          = []
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
    @new_guess = Guess.new(guess, current_card)
    @guesses << @new_guess
    @new_guess
  end

  def move_to_next_card
    @new_guess.correct? ? @number_correct += 1 : deck.cards << deck.cards[@current_card] && @total_cards += 1
    @current_card    += 1
    @number_guesses  +=1
  end

  def percent_correct
    @percent_correct = @number_correct / @number_guesses * 100
  end

  def increment_guess
    @current_guess += 1
  end

  def start
    out_file = File.new("Results - #{Time.new}.txt", "w")
    puts "Welcome! You're playing with #{@total_cards} cards."
    deck.cards.each do |card|
      puts "--------------------------------------------"
      puts "This is card number #{@current_card + 1} out of #{@total_cards}."
      puts card.question
      response = gets.chomp
      if response.upcase == "HINT"
        puts "Here's a hint: " + deck.cards[@current_card].hint
        response = gets.chomp
      end
      record_guess(response)
      move_to_next_card
      puts @guesses[@current_guess].feedback
      if @guesses[@current_guess].feedback == "Incorrect."
        puts "For extra practice we are adding this card to the back of the deck"
      end
      out_file.puts("Card Question:  #{card.question}, Card Answer: #{card.answer}, User Response:  #{response}, #{@guesses[@current_guess].feedback}")
      increment_guess
      percent_correct
      sleep(1)
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct.to_i} guesses out of #{@total_cards} for a score of #{@percent_correct}%"
    out_file.puts("You had #{@number_correct.to_i} guesses out of #{@total_cards} for a score of #{@percent_correct}%")
    out_file.close
  end
end
