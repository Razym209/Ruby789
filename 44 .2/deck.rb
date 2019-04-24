class Deck
  SUITS = %w[♢ ♧ ♤ ♡].freeze
  CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :cards

  def initialize
    @cards = generate_cards
  end

  def generate_cards
    cards = []
    SUITS.each do |suit|
      CARD.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle
  end
end
