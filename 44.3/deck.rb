class Deck

  attr_reader :cards


  def initialize
    @cards = generate_cards
  end

  def generate_cards
    cards = []
    Card::SUITS.each do |suit|
      Card::CARD.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle
  end
end
