require 'pry'
class CardGenerator

attr_reader       :deck, :cards

  def initialize(file)
    @deck = []
    @cards = File.open('../cards.txt', 'r')
  end

  def shovel_text
    @deck << @cards.read
    @deck[0].split("\n")
  end

end
