require_relative 'deck'    #class BlackJack
require_relative 'card'
require_relative 'hand'
require_relative 'user'
require_relative 'card'
require_relative 'hand'
require_relative 'user'
require_relative 'dealer'
require_relative 'player'
require_relative 'menu'
require_relative 'game'



@player = Player.new(name = 'Player')
@dealer = Dealer.new
game = Game.new(@player, @dealer, Deck.new)
@menu = Menu.new(game)  #Terminal Interface

