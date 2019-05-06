class Player < User   #def player_cards
  include TerminalText

  def new_round(player, hand)    # Цикл с игрой - опрос состояния и показ возможных действий
    case command_new
    when 1
      pass_move1 if @passed_the_move
    when 2
       take_card(hand.deal_one_card)
    when 3
      open_cards
    when 4
      exit_game
    end
  end

  def pass_move1
    pass_move
  end
end
