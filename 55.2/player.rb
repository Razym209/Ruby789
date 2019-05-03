class Player < User   #def player_cards

  def pass_move1
    pass_move
  end

  def take_card1
    take_card(hand.deal_one_card)
  end
end
