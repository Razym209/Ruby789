class Game

  protected

  attr_accessor :bank, :game_over

  def start_game
    @bank = 0
    @game_over = false
    @hand = Hand.new
    make_bets
    deal_cards
    play_game
    open_cards
    ask_user_move
  end

  def make_bets
    self.bank += @player.make_bet
    self.bank += @dealer.make_bet
  end

  def deal_cards
    @player.take_cards(@hand.deal_cards)
    @dealer.take_cards(@hand.deal_cards)
  end

  def play_game
    until @game_over
      player_move
      break if @game_over || players_cards_limit_reached?

      dealer_move
      stop_game if players_cards_limit_reached?
    end
  end

  def player_move
    show_info
    command_new(@player)
    self.game_over = @player.opened_cards
  end

  def dealer_move
    show_info
    @dealer.process_decision(@hand)
    self.game_over = @dealer.opened_cards
  end

  def open_cards
    self.game_over = true
    confirm_open_cards
    show_info
    determine_winner
    clear_bank
    collect_cards
    show_balances
    exit_game if players_cannot_play?
    show_base_commands
  end

  def collect_cards
    @player.clear_cards
    @dealer.clear_cards
  end

  def show_balances
    @player.show_balance
    @dealer.show_balance
    puts
  end

  def show_info
    @dealer.show_cards_back unless @game_over
    @dealer.show_cards_face if @game_over
    @player.show_cards_face
    show_score(@dealer.name, @hand.score(@dealer.cards)) if @game_over
    show_score(@player.name, @hand.score(@player.cards))
    show_bank(@bank)
  end

  def stop_game
    show_info
    self.game_over = true
  end

  def determine_winner
    player_score = @hand.score(@player.cards)
    dealer_score = @hand.score(@dealer.cards)
    if @hand.drawn?(player_score, dealer_score)
      drawn_game
      players_take_money(@bank / 2.0)
    elsif @hand.player_win?(player_score, dealer_score)
      @player.win(@bank)
    else
      @dealer.win(@bank)
    end
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
