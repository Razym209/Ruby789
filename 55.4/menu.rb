class Menu
  include TerminalText

  attr_accessor :game, :game_over, :menu


  def initialize
    game = Game.new
    @game = game
    new_game_now
  end

  def new_game_now         # Цикл с игрой - опрос состояния и показ возможных действий
    case show_base_commands
    when 1 then start_game
    when 2 then exit_game
    end
  end

  def start_game
    @game_over = false
    game.make_bets
    game.deal_cards
    game.play_game
    open_cards
  end

 def open_cards
    self.game_over = true
    confirm_open_cards
    game.check_info
    game.determine_winner
    game.clear_bank
    game.collect_cards
    game.show_balances
    exit_game if game.players_cannot_play?
    show_base_commands
  end

end

