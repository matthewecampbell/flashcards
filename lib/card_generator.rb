require 'pry'
class CardGenerator

attr_reader       :file, :cards

  def initialize(file)
    @file = file
    @cards = []
  end

  def cards
    file = File.readlines('cards.txt').map do |line|
    card = line.chomp.split(",")
    Card.new(card[0], card[1])
    end
  end
end
