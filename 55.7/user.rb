class User  # def dealer_cards and player_cards
  include TerminalText
  attr_reader :name, :cards, :balance
  attr_reader :passed_the_move, :took_the_card, :opened_cards
  attr_writer :passed_the_move, :took_the_card, :opened_cards


  BET_AMOUNT = 10
  START_BALANCE = 100
  MAX_CARDS_COUNT = 3

  def initialize(name)
    @name = name
    @balance = START_BALANCE
    @cards = []
    @passed_the_move = false
    @took_the_card = false
    @opened_cards = false
  end

  def make_bet
    @balance -= BET_AMOUNT
    BET_AMOUNT
  end

  def take_money(amount)
    @balance += amount
  end

  def take_cards(cards)
    @cards.concat(cards) if can_take_cards?
  end

  def cards_limit_reached?
    @cards.size == MAX_CARDS_COUNT
  end

  def win(bank)
    win_games(name)
    take_money(bank)
  end

  def clear_cards
    @cards = []
    @passed_the_move = false
    @took_the_card = false
    @opened_cards = false
  end

  def pass_move
    self.passed_the_move = true
  end

  def take_card(card)
    take_cards(card)
    self.took_the_card = true
  end

  def open_cards
    self.opened_cards = true
  end

  def can_take_cards?
    @cards.size < 3
  end

  def show_cards_back
    new_line
    @cards.each { see_cards_back('*') }
    new_line
  end

  def show_cards_face
    new_line
    @cards.each { |card| see_cards_face("#{card.value}#{card.suit}") }
    new_line
  end

  def score
    total_score = 0
    ace_count = 0
    cards.each do |card|
      ace_count += Card::ACE_MIN_VALUE if card.value == 'A'
      total_score += card.score
    end
    ace_count.times do
      ace_score = Card::ACE_MAX_VALUE - Card::ACE_MIN_VALUE
      total_score += ace_score if total_score + ace_score <= Game::WIN_SCORE + 5
    end
    total_score
  end
end
