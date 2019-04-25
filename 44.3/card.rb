class Card

  attr_reader :suit, :value, :cards

  SUITS = %w[♢ ♧ ♤ ♡].freeze
  CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze,

  def initialize(suit, value)
    @suit = suit
    @value = value
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

  def get_card_score(card)
    if %w[J Q K].include? card.value
      DEFAULT_VALUE
    elsif card.value == 'A'
      ACE_MIN_VALUE
    else
      card.value.to_i
    end
  end
end
