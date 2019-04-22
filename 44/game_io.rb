module GameIO
  protected

  def prompt
    STDOUT.write '>> '
    gets.strip
  end

  def player_name
    puts 'Введите свое имя.'
    name = prompt
    raise unless name != ''

    name
  rescue StandardError
    puts 'Имя не может быть пустым.'
    retry
  end

  def command(user)
    ask_user_move(user)
    code = prompt
    exit_game if code == '4'
    raise unless %w[1 2 3].include? code

    code
  rescue StandardError
    puts 'Команда недопустима.'
    retry
  end

  def ask_user_move(user)
    puts "\nЧто вы хотите сделать?"
    puts "Введите '1', чтобы передать ход." unless user.passed_the_move
    puts "Введите '2' получить одну карту." unless user.took_the_card
    puts "Введите '3' открыть свои карты."
    puts "Введите '4' выход."
  end

  def confirm_open_cards
    puts 'Нажмите любую клавишу, чтобы открыть карты'
    gets
  end

  def confirm_start_new_game
    puts 'Нажмите любую клавишу, чтобы продолжить'
    gets
  end

  def exit_game
    puts 'ИГРА ЗАКОНЧЕНА!'
    exit
  end

  def start_new_game
    puts 'Старт новой игры.'
  end

  def drawn_game
    puts 'Ничья'
  end

  def show_base_commands
    puts "Ведите'yes' для старта новой игры или 'no' для выхода."
  end

  def show_score(name, score)
    puts "\n\n#{name} ваши баллы: #{score}"
  end

  def show_bank(bank)
    puts "\nБанк: #{bank}"
  end
end
