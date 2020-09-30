VALID_CHOICES = %w(rock paper scissors lizard spock)

LIST_OF_COUNTERS = { 'rock' => ['scissors', 'lizard'],
                     'paper' => ['spock', 'rock'],
                     'scissors' => ['paper', 'lizard'],
                     'lizard' => ['spock', 'paper'],
                     'spock' => ['scissors', 'rock'] }

def prompt(message)
  puts("=> #{message}")
end

def player_win?(player, computer)
  if win?(player, computer)
    true
  else
    false
  end
end

def computer_win?(player, computer)
  if win?(computer, player)
    true
  else
    false
  end
end

def win?(first, second)
  LIST_OF_COUNTERS[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("It's a tie!")
  end
end

player_wins = 0
computer_wins = 0
loop do # main loop
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}. First player to 5 wins!")
    loop do
      choice = gets.chomp
      if choice != 's'
        break
      else
        prompt("Please specify scissors or spock (sc or sp)")
      end
    end

    VALID_CHOICES.each do |word|
      if word.start_with?(choice)
        choice = word
        break
      end
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "Your choice: #{choice}. Computer chose: #{computer_choice}."

  display_result(choice, computer_choice)

  if player_win?(choice, computer_choice)
    player_wins += 1
  elsif computer_win?(choice, computer_choice)
    computer_wins += 1
  end
  prompt("Player wins:#{player_wins}. Computer wins:#{computer_wins}")

  if player_wins == 5
    prompt("Congratulations! You win!")
    break
  elsif computer_wins == 5
    prompt("Computer wins! You lose!")
    break
  end

  prompt("Would you like to play again? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing!")
