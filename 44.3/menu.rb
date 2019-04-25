require_relative 'game'
require_relative 'deck'

game = Game.new(Deck.new)
game.start_game
