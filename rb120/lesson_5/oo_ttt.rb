require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset_game
  end

  def unmarked_keys # array of keys yet to be marked
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def middle_empty?
    @squares[TTTGame::MIDDLE_SQUARE].unmarked?
  end

  # use unmarked_keys method? (after line.include?(k))
  def find_at_risk_square(line, marker)
    if @squares.values_at(*line).select(&:marked?).collect(&:marker).count(marker) == 2
      @squares.select { |k, _| line.include?(k) && @squares[k].marker == Square::INITIAL_MARKER }.keys.first
    end
  end

  def reset_game
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(num, marker)
    @squares[num].marker = marker
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :name, :marker

  def initialize
    @marker = nil
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "Welcome! What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Please enter a value."
    end
    self.name = n
  end

  def choose_marker
    choice = nil
    loop do
      puts "Would you like to be X or O?"
      choice = gets.chomp.upcase
      break if choice == 'X' || choice == 'O'
      puts "Invalid answer. Try again."
    end
    @marker = choice
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'WALL-E', 'C3PO', 'Terminator', 'Bender'].sample
  end

  def choose_marker(human_marker)
    @marker = human_marker == 'X' ? 'O' : 'X'
  end
end

class TTTGame
  WINNING_SCORE = 3
  MIDDLE_SQUARE = 5

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_marker = nil
    @first_to_move = nil
  end

  def play
    clear
    set_names
    set_markers
    display_welcome_message
    choose_first_move
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      loop do
        display_board
        player_move
        display_result
        if grand_champion?
          display_winner_message
          break
        end
        start_next_round
        reset
      end
      reset_score
      break unless play_again?
      reset
      display_play_again_message
      set_markers
      choose_first_move
    end
  end

  def set_markers
    human.choose_marker
    computer.choose_marker(human.marker)
  end

  def choose_first_move
    puts "Would you like to go 1st or 2nd? (choose 1 or 2)"
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if choice == 1 || choice == 2
      puts "Invalid choice. Try again."
    end
    @first_to_move = if choice == 1
                       human.marker
                     else
                       computer.marker
                     end
    @current_marker = @first_to_move
    clear
  end

  def set_names
    clear
    human.set_name
    computer.set_name
  end

  def grand_champion?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def start_next_round
    puts "Press enter to begin next round."
    gets
  end

  def computer_moves
    square = nil
    square = MIDDLE_SQUARE if board.middle_empty?

    if !square then square = computer_offense(square) end
    if !square then square = computer_defense(square) end
    if !square then square = board.unmarked_keys.to_a.sample end

    board[square] = computer.marker
  end

  # two methods below redundant?
  def computer_offense(square)
    Board::WINNING_LINES.each do |line|
      square = board.find_at_risk_square(line, computer.marker)
      break if square
    end
    square
  end

  def computer_defense(square)
    Board::WINNING_LINES.each do |line|
      square = board.find_at_risk_square(line, human.marker)
      break if square
    end
    square
  end

  def display_winner_message
    if human.score == WINNING_SCORE
      puts "You are the winner!"
    elsif computer.score == WINNING_SCORE
      puts "The computer is the winner!"
    end
  end

  def display_welcome_message
    puts "Welcome to TicTacToe, #{human.name}!"
    puts "First to #{WINNING_SCORE} wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing TicTacToe! Goodbye!"
  end

  def clear
    system 'clear'
  end

  def display_board
    puts "You are #{human.marker}. #{computer.name} is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def display_score
    puts "Your score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(choices, separator=', ', word='or')
    case choices.length
    when 0 then ''
    when 1 then choices.first
    when 2 then choices.join(" #{word} ")
    else
      choices[-1] = "#{word} #{choices.last}"
      choices.join(separator)
    end
  end

  def human_moves
    puts "Choose a square: (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, not a valid choice."
    end

    board[square] = human.marker
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  # will need an update score method
  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
      human.score += 1
    when computer.marker
      puts "Computer won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
    display_score
  end

  def play_again?
    answer = nil
    loop do
      puts "Play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset_game
    @current_marker = @first_to_move
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
