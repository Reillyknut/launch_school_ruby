require 'pry'
class Participant
  attr_accessor :hand

  def initialize
    @hand = []
    # @name
  end

  def hit(deck)
    deck.deal_card(hand)
  end

  def busted?
    total > 21
  end

  def total
    total_value = 0
    hand.each do |card|
      total_value += card.worth
    end

    hand.select { |card| card.value == 'Ace' }.count.times do
      break if total_value <= 21
      total_value -= 10
    end

    total_value
  end
end

class Player < Participant
  def initialize
    super
    @name = nil # set_name later
  end

  def stay? # improve later
    choice = gets.chomp.downcase
    choice == "stay"
  end
end

class Dealer < Participant
  def initialize
    super
    @name = nil # set_name later
  end

  def stay?
    total >= 17
  end
end

class Deck
  FULL_DECK = {
    Hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
    Diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
    Spades: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
    Clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  }

  attr_accessor :cards

  def initialize
    @cards = shuffle_cards
  end

  def shuffle_cards
    deck = []
    FULL_DECK.each do |suit, values|
      values.each do |card|
        deck << Card.new(suit, card)
      end
    end
    deck = deck.shuffle
  end

  def deal_card(participant_hand)
    participant_hand << @cards.pop
  end
end

class Card
  FACE_CARDS = ['Jack', 'Queen', 'King']

  attr_reader :suit, :value, :worth

  def initialize(suit, value)
    @suit = suit
    @value = value
    @worth = determine_worth
  end

  def determine_worth
    if FACE_CARDS.include?(value)
      10
    elsif value == "Ace"
      11
    else
      value
    end
  end
end

class Game
  DEALER_MAX = 17
  BUST_NUMBER = 22
  WINNING_SCORE = 5

  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_cards
    deck.deal_card(player.hand)
    deck.deal_card(dealer.hand)
    deck.deal_card(player.hand)
    deck.deal_card(dealer.hand)
  end

  def display_deal_message
    puts "Press enter to deal cards."
    gets
    clear
  end

  def display_initial_hands # create a display last card method?
    puts "You have: "
    puts "#{player.hand[0].value} of #{player.hand[0].suit}"
    puts "#{player.hand[1].value} of #{player.hand[1].suit}"
    puts ""
    puts "Dealer's visible card is: "
    puts "#{dealer.hand[1].value} of #{dealer.hand[1].suit}"
    puts ""
  end

  def display_initial_values
    puts "+========================+"
    display_player_value
    puts "Visible dealer value: #{dealer.hand.last.worth}"
    puts "+========================+"
  end

  def display_hit_or_stay
    puts ""
    puts "Would you like to hit or stay?"
  end

  def display_welcome_message
    clear
    puts ""
    puts "****************** Welcome to 21! ******************"
    puts ""
  end

  def display_hands # move to class
    display_player_hand
    display_dealer_hand
  end

  def display_player_hand # move to class
    puts "You have: "
    player.hand.each do |card|
      puts "#{card.value} of #{card.suit}"
    end
  end

  def display_dealer_hand # move to class
    puts ""
    puts "Dealer has: "
    dealer.hand.each do |card|
      puts "#{card.value} of #{card.suit}"
    end
  end

  def display_hands_and_values # move to class
    clear
    display_hands
    puts ""
    display_values
  end

  def display_dealer_value # move to class
    puts "Dealer value: #{dealer.total}"
  end

  def display_values # move to class
    puts "+==================+"
    display_player_value
    display_dealer_value
    puts "+==================+"
  end

  def display_player_value # move to class
    puts "Player value: #{player.total}"
  end

  def display_player_hit_message # move to class
    puts "Player hits."
    puts "#{player.hand.last.value} of #{player.hand.last.suit}"
  end

  def display_dealer_hit_message # move to class
    puts "Dealer hits."
    puts "#{dealer.hand.last.value} of #{dealer.hand.last.suit}"
  end

  def display_result
    if player.busted? then puts "You busted. Dealer wins!"
    elsif dealer.busted? then puts "Dealer busted. You win!"
    elsif player.total > dealer.total then puts "You win!"
    elsif player.total < dealer.total then puts "Dealer wins!"
    else
      puts "Tie!"
    end
  end

  def display_goodbye
    clear
    puts "Thanks for playing 21. Goodbye!"
  end

  def player_turn
    loop do
      display_hit_or_stay
      break if player.stay? # display stay message
      player.hit(deck)
      clear
      display_player_hand
      puts ""
      puts "Dealer's visible card is: "
      puts "#{dealer.hand[1].value} of #{dealer.hand[1].suit}"
      puts ""
      display_initial_values
      puts ""
      display_player_hit_message
      break if player.busted?
    end
  end

  def dealer_turn
    return if player.busted?
    display_hands_and_values
    sleep 2 # create short_pause method?
    loop do
      if dealer.stay?
        display_hands_and_values
        puts 'Dealer stays.'
        break
      end
      dealer.hit(deck)
      display_hands_and_values
      puts ""
      display_dealer_hit_message
      puts ""
      sleep 2 # create short_pause method?
      if dealer.busted?
        display_hands_and_values
        break
      end
    end
  end

  def play_again?
    puts ""
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if answer == 'y' || answer == 'n'
      puts "Please enter y or n"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    deck.cards = deck.shuffle_cards
    player.hand = []
    dealer.hand = []
    clear
  end

  def main_game
    display_deal_message
    deal_cards
    display_initial_hands
    display_initial_values
    player_turn
    dealer_turn
    puts ""
    display_result
  end

  def start
    display_welcome_message

    loop do
      main_game
      break unless play_again?
      reset
    end
    display_goodbye
  end
end

Game.new.start

# make a bunch of stuff private
# move display player values/hands to their respective classes
# display dealer second card as '???'
# add (h)it and (s)tay options
# fix puts "" lines
# rubocop
