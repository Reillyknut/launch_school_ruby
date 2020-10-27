# ------------------------------ # Constants # ------------------------------ #
FULL_DECK = {
  Hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
  Diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
  Spades: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
  Clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
}
FACE_CARDS = ['Jack', 'Queen', 'King']
DEALER_MAX = 17
BUST_NUMBER = 22
WINNING_SCORE = 5

# ------------------------------- # Methods # ------------------------------- #

def clear_screen
  system 'clear'
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck(cards)
  deck = []
  cards.each do |suit, values|
    values.each do |card|
      deck << [suit, card]
    end
  end
  deck.shuffle
end

def deal_initial_cards(deck, player, dealer)
  player << deck.pop
  dealer << deck.pop
  player << deck.pop
  dealer << deck.pop
end

def deal_card(deck, player_or_dealer)
  player_or_dealer << deck.pop
end

def hand_value(hand)
  total_value = 0
  hand.each do |card|
    total_value = if FACE_CARDS.include?(card[1])
                    total_value + 10
                  elsif card[1] == 'Ace'
                    total_value + 11
                  else
                    total_value + card[1]
                  end
  end
  hand.select { |card| card[1] == 'Ace' }.count.times do
    total_value -= 10 if total_value >= BUST_NUMBER
  end
  total_value
end

def busted?(hand_value)
  hand_value >= BUST_NUMBER
end

def display_values(player_value = nil, dealer_value = nil)
  puts ""
  if player_value && dealer_value
    prompt "Player value: #{player_value}  Dealer value: #{dealer_value}"
  elsif player_value
    prompt "Player value: #{player_value}"
  elsif dealer_value
    prompt "Dealer value: #{dealer_value}"
  end
end

def display_initial_hands(player_hand, dealer_hand)
  prompt "You have: "
  player_hand.each do |card|
    display_card(card)
  end
  puts ""
  prompt "Dealer has:"
  prompt "#{dealer_hand[1][1]} of #{dealer_hand[1][0]}"
end

def display_full_hands(player_hand, dealer_hand)
  puts ""
  prompt "You have: "
  player_hand.each do |card|
    display_card(card)
  end
  puts ""
  prompt "Dealer has:"
  dealer_hand.each do |card|
    display_card(card)
  end
  puts ""
end

def display_card(card)
  prompt "#{card[1]} of #{card[0]}"
end

def display_invalid_choice
  prompt "Sorry, that's not a valid choice."
end

def display_welcome
  prompt "Welcome to 21. First to 5 wins!"
end

def display_goodbye
  prompt "Thanks for playing 21! Goodbye."
end

def display_hit_or_stay
  puts ""
  prompt "Would you like to hit or stay?"
end

def display_second_dealer_card(dealer_hand, dealer_total)
  puts ""
  prompt "Dealer's 2nd card is #{dealer_hand[0][1]} of #{dealer_hand[0][0]}."
  prompt "Dealer value: #{dealer_total}" # seperate method for this?
  puts ""
  short_pause # short pause for readability
end

def display_first_dealer_value(dealer_hand)
  value = dealer_hand[1][1]
  if FACE_CARDS.include?(value)
    value = 10
  end
  prompt "Visible dealer value: #{value}"
end

def display_round_winner(player_total, dealer_total)
  if !busted?(player_total) && !busted?(dealer_total)
    if player_total > dealer_total
      prompt "Player wins!"
    elsif player_total < dealer_total
      prompt "Dealer wins!"
    else
      prompt "It's a tie!"
    end
  end
end

def display_winner(winner)
  prompt "#{winner} wins!"
end

def display_next_round
  prompt "Hit Enter to play next round."
  gets.chomp
end

def display_score(score)
  prompt "Player: #{score[:player]}. Dealer: #{score[:dealer]}"
end

def play_again?
  loop do
    puts ""
    prompt "Play again? (y or n)"
    answer = gets.chomp
    return false if answer.downcase == 'n' || answer.downcase == 'no'
    if answer.downcase == 'y' || answer.downcase == 'yes'
      clear_screen
      return true
    end
    display_invalid_choice
  end
end

def press_enter_to_start
  prompt "Press Enter to deal cards"
  gets.chomp
end

def initialize_scoreboard
  { player: 0, dealer: 0 }
end

def overall_winner(score)
  if score[:player] == WINNING_SCORE
    return "Player"
  elsif score[:dealer] == WINNING_SCORE
    return "Dealer"
  end
  nil
end

def detect_winner(player_total, dealer_total)
  if busted?(player_total) then "Dealer"
  elsif busted?(dealer_total) then "Player"
  elsif player_total > dealer_total then "Player"
  elsif player_total < dealer_total then "Dealer"
  end
end

def update_score(winner, score)
  score[:player] += 1 if winner == "Player"
  score[:dealer] += 1 if winner == "Dealer"
end

def short_pause
  sleep 2
end

# ------------------------------ # Game Loop # ------------------------------ #
clear_screen
display_welcome

loop do
  score = initialize_scoreboard

  loop do
    display_score(score)
    press_enter_to_start

    deck = initialize_deck(FULL_DECK)
    player_hand = []
    dealer_hand = []

    deal_initial_cards(deck, player_hand, dealer_hand)
    display_initial_hands(player_hand, dealer_hand)

    player_total = hand_value(player_hand)
    dealer_total = hand_value(dealer_hand)

    display_values(player_total, nil)
    display_first_dealer_value(dealer_hand)

    loop do # player loop
      display_hit_or_stay
      answer = gets.chomp.downcase

      if answer == 'hit' || answer == 'stay'
        if answer == 'hit'
          deal_card(deck, player_hand)
          display_card(player_hand.last)
          player_total = hand_value(player_hand)
          display_values(player_total, nil)

          if busted?(player_total)
            prompt "Busted! Dealer wins."
            puts ""
            break
          end

        elsif answer == 'stay' then break
        end
      else
        display_invalid_choice
      end
    end

    unless busted?(player_total) # dealer loop
      display_second_dealer_card(dealer_hand, dealer_total)
      loop do
        if busted?(dealer_total)
          prompt "Dealer busted! Player wins."
          break
        elsif dealer_total >= DEALER_MAX
          prompt "Dealer stays."
          break
        else
          prompt "Dealer hits."
          deal_card(deck, dealer_hand)
          display_card(dealer_hand.last)
          dealer_total = hand_value(dealer_hand)
          display_values(nil, dealer_total)
          puts ""
          short_pause # short pause for readability
        end
      end
    end

    display_values(player_total, dealer_total)
    display_round_winner(player_total, dealer_total)
    display_full_hands(player_hand, dealer_hand)
    update_score(detect_winner(player_total, dealer_total), score)

    winner = overall_winner(score)

    if winner == "Player" || winner == "Dealer"
      display_winner(winner)
      display_score(score)
      break
    end

    display_score(score)

    display_next_round
    clear_screen
  end
  break unless play_again?
end
display_goodbye
