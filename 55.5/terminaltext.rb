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

  def command_new
    puts "\nЧто вы хотите сделать?"
    puts "Введите '1', чтобы передать ход."
    puts "Введите '2' получить одну карту."
    puts "Введите '3' открыть свои карты."
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
      @player.pass_move1
    when 2
       @player.take_card(hand.deal_one_card)
    when 3
      @player.open_cards && !@took_the_card
    end
  end

  def see_cards_back(card1)
    printf('%4s', '*')
  end

  def see_cards_face(card2)
    printf('%4s', "#{card2}")
  end

  def new_line
    puts
  end
end

