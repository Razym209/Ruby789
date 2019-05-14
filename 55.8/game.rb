class Game                #class Game
  include TerminalText

  attr_accessor :bank, :game_over, :hand, :pass_one, :player_take_one_card

  WIN_SCORE = 21

  def initialize
    @player = Player.new(name = 'Player')
    @dealer = Dealer.new
  end

 #def actions

  def make_bets
    @bank = 0
    @game_over = false
    @hand = Hand.new
    @pass_one = false
    @player_take_one_card = false
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

  def players_cannot_play?
    @player.balance.zero? || @dealer.balance.zero?
  end

  def play_game
    until @game_over
      player_move
      break if @game_over
      dealer_move
    end
  end

  def player_move
    check_info
    new_round(@player, @hand)
    self.game_over = @player.opened_cards
  end

  def check_info
    @dealer.show_cards_back unless @game_over
    @dealer.show_cards_face if @game_over
    @player.show_cards_face
    show_score(@dealer.name, @dealer.score) if @game_over
    show_score(@player.name, @player.score)
    show_bank(@bank)
  end

  def dealer_move
    check_info
    @dealer.process_decision(@hand)
    self.game_over = @dealer.opened_cards
  end

  def stop_game
    check_info
    self.game_over = true
  end

  def show_balances
    show_balance(@player.name, @player.balance)
    show_balance(@dealer.name, @dealer.balance)
  end

  def determine_winner
    player_score = @player.score
    dealer_score = @dealer.score
    if @hand.drawn?(player_score, dealer_score)
      drawn_game
      players_take_money(@bank / 2.0)
    elsif @hand.player_win?(player_score, dealer_score)
      @player.win(@bank)
    else
      @dealer.win(@bank)
    end
  end
end

