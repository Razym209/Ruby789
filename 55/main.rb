require_relative 'game'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'user'
require_relative 'card'
require_relative 'hand'
require_relative 'user'
require_relative 'dealer'
require_relative 'player'
require_relative 'menu'

game = Game.new(Deck.new)
game.start_game
