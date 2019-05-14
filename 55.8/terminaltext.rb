module TerminalText

  protected

  def player_new
    puts 'Введите свое имя.'
    gets.chomp
  end

  def show_base_new
    puts "Ведите 1 для старта новой игры или 2 для выхода."
    gets.to_i
  end

  def player_cards_player
    puts 'Карты Игрока'
  end

  def player_cards_dealer
    puts 'Карты Дилера'
  end

  def exit_game
    puts 'ИГРА ЗАКОНЧЕНА!'
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

  def new_round(player, hand)
    case command_new
    when 1
      player.pass_move
      @pass_one = true
      player.can_pass?
    when 2
      player.take_card(hand.deal_one_card)
      @pass_one = true
    when 3
      player.open_cards
      player.can_take_card?
    end
  end

  def command_new
    puts "\nЧто вы хотите сделать?"
    puts "Введите '1', чтобы передать ход." unless @pass_one
    puts "Введите '2' получить одну карту." unless @pass_one
    puts "Введите '3' открыть свои карты." if @pass_one
    gets.to_i
  end

  def see_cards_back(card1)
    printf('%4s', '*')
  end

  def see_cards_face(card)
    printf('%4s', "#{card}")
  end

  def new_line
    puts
  end

  def win_games(name)
    puts "#{@name} выиграл!"
  end
end

