class Menu

  attr_accessor :game, :game_over

  def initialize(game)
    @game = game
    new_game_now
  end

  def new_game_now         # Цикл с игрой - опрос состояния и показ возможных действий
    case show_base_commands
    when 1 then start_game
    when 2 then exit_game
    end
  end

  def new_round(user)    # Цикл с игрой - опрос состояния и показ возможных действий
    case command_new(user)
    when 1
      @player.pass_move1 if @passed_the_move
    when 2
      @player.take_card1 if !@took_the_card
    when 3
      open_cards
    when 4
      exit_game
    end
  end

def start_game
    game.make_bets
    game.deal_cards
    play_game
    open_cards
  end

def open_cards
    self.game_over = true
    confirm_open_cards
    show_info
    determine_winner
    game.clear_bank
    game.collect_cards
    show_balances
    exit_game if game.players_cannot_play?
    show_base_commands
  end

  def show_balances
    self.class.show_balance(@player.name, @player.balance)
    self.class.show_balance(@dealer.name, @dealer.balance)
  end

  def show_info
    @dealer.show_cards_back unless @game_over
    @dealer.show_cards_face if @game_over
    @player.show_cards_face
    show_score(@dealer.name, @hand.score(@dealer.cards)) if @game_over
    show_score(@player.name, @hand.score(@player.cards))
    show_bank(@bank)
  end

  def determine_winner
    player_score = @hand.score(@player.cards)
    dealer_score = @hand.score(@dealer.cards)
    if @hand.drawn?(player_score, dealer_score)
      drawn_game
      game.players_take_money(@bank / 2.0)
    elsif @hand.player_win?(player_score, dealer_score)
      @player.win(@bank)
    else
      @dealer.win(@bank)
    end
  end

  def player_move
    show_info
    new_round(@player)
    self.game_over = @player.opened_cards
  end

  def dealer_move
    show_info
    @dealer.process_decision(@hand)
    self.game_over = @dealer.opened_cards
  end

  def play_game
    until @game_over
      player_move
      break if @game_over || players_cards_limit_reached?

      dealer_move
      stop_game if players_cards_limit_reached?
    end
  end

  def stop_game
    show_info
    self.game_over = true
  end

 # Terminal Interface

  def player_new
    puts 'Введите свое имя.'
    gets.chomp
  end

  def show_base_commands
    puts "Ведите'1' для старта новой игры или '2' для выхода."
    gets.to_i
  end

  def command_new(user)
    puts "\nЧто вы хотите сделать?"
    puts "Введите '1', чтобы передать ход."
    puts "Введите '2' получить одну карту."
    puts "Введите '3' открыть свои карты."
    puts "Введите '4' выход."
    gets.to_i
  end

  def exit_game
    puts 'ИГРА ЗАКОНЧЕНА!'
  end

  def confirm_open_cards
    puts 'Нажмите любую клавишу, чтобы открыть карты'
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

  def show_balance(name, balance)
    puts "#{name} ваш баланс: #{balance}"
  end
end
