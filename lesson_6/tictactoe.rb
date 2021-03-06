# -------------------------- # Constants # -------------------------- #

PLAYER = 'Player'
COMPUTER = 'Computer'
WINNING_SCORE = 5
MIDDLE_SQUARE = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_MOVE = 'Choose' # valid choices include 'Choose', Player' and 'Computer'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

# -------------------------- # Methods # -------------------------- #

def clear_screen
  system 'clear'
end

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def joinor(array, separator = ', ', word = 'or')
  if array.length == 1
    return array[0].to_s
  elsif array.length == 2
    return "#{array[0]} or #{array[1]}"
  end

  last_num = array.pop.to_s
  array.join(separator) + separator + word + ' ' + last_num
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  clear_screen
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "First to #{WINNING_SCORE} wins!"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(board, current_player)
  if current_player == PLAYER
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == PLAYER ? COMPUTER : PLAYER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def who_goes_first(first_move)
  if first_move == 'Choose' then player_choose_move
  elsif first_move == PLAYER then PLAYER
  elsif first_move == COMPUTER then COMPUTER
  end
end

def player_choose_move
  loop do
    prompt "Would you like to go 1st or 2nd? (choose 1 or 2)"
    choice = gets.chomp
    if valid_number?(choice) && (choice.to_i == 1 || choice.to_i == 2)
      case choice.to_i
      when 1 then return PLAYER
      when 2 then return COMPUTER
      end
    else
      display_invalid_choice
    end
  end
end

def display_invalid_choice
  prompt "Sorry, that's not a valid choice."
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp
    if empty_squares(brd).include?(square.to_i) && valid_number?(square)
      square = square.to_i
      break
    else
      display_invalid_choice
    end
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  square = MIDDLE_SQUARE if middle_empty?(brd)

  if !square
    square = computer_offense(square, brd)
  end

  if !square
    square = computer_defense(square, brd)
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def middle_empty?(brd)
  empty_squares(brd).include?(MIDDLE_SQUARE)
end

def computer_offense(square, brd)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def computer_defense(square, brd)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return PLAYER
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return COMPUTER
    end
  end
  nil
end

def display_score(score)
  prompt "#{PLAYER}: #{score[:player]}. #{COMPUTER}: #{score[:computer]}"
end

def update_score(winner, score)
  score[:player] += 1 if winner == PLAYER
  score[:computer] += 1 if winner == COMPUTER
end

def initialize_scoreboard
  { player: 0, computer: 0 }
end

def overall_winner(score)
  if score[:player] == WINNING_SCORE
    return PLAYER
  elsif score[:computer] == WINNING_SCORE
    return COMPUTER
  end
  nil
end

def display_round_win(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
end

def play_again?
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp
    return false if answer.downcase == 'n' || answer.downcase == 'no'
    return true if answer.downcase == 'y' || answer.downcase == 'yes'
    display_invalid_choice
  end
end

def display_winner(winner)
  prompt "#{winner} wins!"
end

def display_next_round
  prompt "Hit Enter to play next round."
  gets.chomp
end

def display_goodbye
  prompt "Thanks for playing Tic-Tac-Toe! Goodbye."
end

def display_welcome
  prompt "Welcome to Tic-Tac-Toe!"
end

# -------------------------- # Game loop # -------------------------- #
clear_screen
display_welcome
loop do
  score = initialize_scoreboard
  loop do
    board = initialize_board
    current_player = who_goes_first(FIRST_MOVE)

    loop do
      display_board(board)
      display_score(score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    update_score(detect_winner(board), score)
    display_board(board)
    winner = overall_winner(score)

    if winner == PLAYER || winner == COMPUTER
      display_winner(winner)
      display_score(score)
      break
    end

    display_round_win(board)
    display_score(score)
    display_next_round
  end

  break unless play_again?
end
display_goodbye
