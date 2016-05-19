require 'pry'
class CardGenerator

attr_reader       :file

  def initialize(file)
    @file = file
  end

  def cards
    file = File.readlines('cards.txt').map do |line|
    card = line.chomp.split(",")
    Card.new(card[0], card[1])
    end
  end
end
