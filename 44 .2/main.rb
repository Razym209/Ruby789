class Main

  def initialize
    @player
    @dealer = Dealer.new
  end

  def player_go_new
    puts 'Введите свое имя.'
    name = gets.chomp
    @player = Player.new(name)
    show_base_commands
  end

  def show_base_commands
    puts "Ведите'yes' для старта новой игры или 'no' для выхода."
    decision = gets.chomp
    if decision == 'yes'
      puts 'Старт новой игры.'
      start_game
    elsif decision == 'no'
      exit_game
    else
     puts 'Команда недопустима.'
    end
  end

  def command_new(user)
    puts "\nЧто вы хотите сделать?"
    puts "Введите '1', чтобы передать ход." unless user.passed_the_move
    puts "Введите '2' получить одну карту." unless user.took_the_card
    puts "Введите '3' открыть свои карты."
    puts "Введите '4' выход."
    enter = gets.chomp
    if enter == '1' && !@passed_the_move
      puts "выбрано - переход хода."
      @player.pass_move
    elsif enter == '2' && !@took_the_card
      puts "выбрано - взять карту."
      @player.can_take_card
    elsif enter == '3'
      puts "выбрано - открыть карты."
      open_cards
    else enter == '4'
      puts 'ИГРА ЗАКОНЧЕНА!'
    end
  end



  def confirm_open_cards
    puts 'Нажмите любую клавишу, чтобы открыть карты'
    gets
  end

  def confirm_start_new_game
    puts 'Нажмите любую клавишу, чтобы продолжить'
    gets
  end

  def drawn_game
    puts 'Ничья'
  end

  def show_score(name, score)
    puts "\n#{name} ваши баллы: #{score}"
  end

  def show_bank(bank)
    puts "\nБанк: #{bank}"
  end

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

