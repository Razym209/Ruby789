class Player < User

  def initialize(name)
    @name = name
    @balance = START_BALANCE
    @cards = []
    @passed_the_move = false
    @took_the_card = false
    @opened_cards = false
  end

  def pass_move
    self.passed_the_move = true
  end

  def can_take_card
    take_card(hand.deal_one_card)
  end

end
