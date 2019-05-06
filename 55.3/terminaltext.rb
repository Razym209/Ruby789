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
end

