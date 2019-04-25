class Dealer < User
  PASS_SCORE = 18

  def initialize(name = 'Дилер')
    super(name)
  end

  def process_decision(hand)
    if can_pass?(hand.score(@cards))
      pass_move
    elsif can_take_card?
      take_card(hand.deal_one_card)
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
