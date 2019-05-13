class Card
  include TerminalText
  attr_reader :suit, :value

  SUITS = %w[♢ ♧ ♤ ♡].freeze
  CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  DEFAULT_VALUE = 10
  ACE_MIN_VALUE = 1

  def initialize(suit, value)
    @suit = suit
    @value = value
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
