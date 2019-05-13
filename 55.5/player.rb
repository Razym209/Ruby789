class Player < User   #def player_cards
  include TerminalText

  def pass_move1
    self.passed_the_move = true
  end
end
