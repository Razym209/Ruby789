class Dealer < User  #def dealer_cards
  include TerminalText
  PASS_SCORE = 18

  def initialize(name = 'Дилер')
    super(name)
  end

  def process_decision(hand)
    if can_pass?(score)
      pass_move
      open_cards
    elsif can_take_card?
      take_card(hand.deal_one_card)
      open_cards
    else
      open_cards
    end
  end

  def can_pass?(score)
    score >= PASS_SCORE && !@passed_the_move
  end

  def can_take_card?
    !@took_the_card
  end
end
