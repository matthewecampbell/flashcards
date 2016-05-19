# This class takes in a text file and turns it into flashcards.
require 'pry'
class CardGenerator

  attr_reader       :file

  def initialize(file)
    @file           = file
  end

  def cards
    # This takes in the text file and iterates through.
    file_1 = File.readlines(file).map do |line|
    # It goes through each line, individually and takes off the \n and splits
    # string at the "," which will divide the question and answer.
      card = line.chomp.split(",")
    # This will create a new card with the arguments for question and answer
    # coming from the card array at index 0 and 1 respectively.
      Card.new(card[0], card[1])
    end
  end
end
