class Player < User   #def player_cards
  include TerminalText

  def pass_move_true
    self.passed_the_move = true
  end
end
