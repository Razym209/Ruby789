class Player < User
  def process_decision(command, hand)
    if can_pass?(command)
      pass_move
    elsif can_take_card?(command)
      take_card(hand.deal_one_card)
    elsif can_open_cards?(command)
      open_cards
    end
  end

  def can_pass?(command)
    command == '1' && !@passed_the_move
  end

  def can_take_card?(command)
    command == '2' && !@took_the_card
  end
end
