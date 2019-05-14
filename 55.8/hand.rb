class Hand
  include TerminalText

  def initialize
    deck = Deck.new
    @cards = deck.cards
  end

  def deal_cards(count = 2)
    @cards.sample(count).each { |value| @cards.delete(value) }
  end

  def deal_one_card
    deal_cards(1)
  end

  def drawn?(player_score, dealer_score)
    player_score == dealer_score
  end

  def player_win?(player_score, dealer_score)
    win_score?(player_score) || player_less_difference?(player_score, dealer_score)
  end

  def player_less_difference?(player_score, dealer_score)
    score_difference(player_score) < score_difference(dealer_score)
  end

  protected

  def win_score?(score)
    Game::WIN_SCORE == score
  end

  def score_difference(score)
    (Game::WIN_SCORE - score).abs
  end
end
