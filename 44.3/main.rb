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
    case enter
     when enter == '1' && !@passed_the_move
      puts "выбрано - переход хода."
      @player.pass_move
    when enter == '2' && !@took_the_card
      puts "выбрано - взять карту."
      @player.can_take_card
    when enter == '3'
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

  def drawn_game
    puts 'Ничья'
  end

  def show_score(name, score)
    puts "\n#{name} ваши баллы: #{score}"
  end

  def show_bank(bank)
    puts "\nБанк: #{bank}"
  end
end

