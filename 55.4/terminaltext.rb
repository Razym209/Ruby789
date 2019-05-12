module TerminalText

  protected

  def player_new
    puts 'Введите свое имя.'
    gets.chomp
  end

  def show_base_commands
    puts "Ведите'1' для старта новой игры или '2' для выхода."
    gets.to_i
  end

  def command_new
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

  def new_round(player, hand)
    case command_new
    when 1
      @player.pass_move1 if @passed_the_move
    when 2
       @player.take_card(hand.deal_one_card)
    when 3
      @player.open_cards if @took_the_card
    when 4
      exit_game
    end
  end

  def show_cards_back1(card1, card2)
    printf('%4s', '*')
  end

  def show_cards_face1(card3, card4)
    printf('%4s', "#{card4}")
  end
end

