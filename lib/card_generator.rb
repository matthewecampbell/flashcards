require 'pry'
class CardGenerator

  attr_reader       :file

  def initialize(file)
    @file           = file
  end

  def cards
    file_1 = File.readlines(file).map do |line|
      card = line.chomp.split(",")
      Card.new(card[0], card[1], card[2])
    end
  end
end
