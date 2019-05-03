class Game                #class Game


  attr_accessor :bank, :game_over
  attr_accessor :menu

  def initialize(player, dealer, deck)
    @bank = 0
    @hand = Hand.new
    @game_over = false
    @player = player
    @dealer = dealer
    @winner = nil
  end

 #def actions

  def make_bets
    self.bank += @player.make_bet
    self.bank += @dealer.make_bet
  end

  def deal_cards
    @player.take_cards(@hand.deal_cards)
    @dealer.take_cards(@hand.deal_cards)
  end

  def collect_cards
    @player.clear_cards
    @dealer.clear_cards
  end


  def players_take_money(amount)
    @dealer.take_money(amount)
    @player.take_money(amount)
  end

  def clear_bank
    self.bank = 0
  end

  def players_cards_limit_reached?
    @player.cards_limit_reached? && @dealer.cards_limit_reached?
  end

  def players_cannot_play?
    @player.balance.zero? || @dealer.balance.zero?
  end
end
