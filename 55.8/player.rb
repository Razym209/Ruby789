class Player < User   #def player_cards
  include TerminalText

  def can_take_card?
    !@took_the_card
  end

  def can_pass?
  !@passed_the_move
  end
end
