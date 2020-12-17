class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def to_s
    @value
  end
end

class Rock < Move
  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?))
  end
end

class Paper < Move
  def >(other_move)
    (paper? && (other_move.rock? || other_move.spock?))
  end

  def <(other_move)
    (paper? && (other_move.scissors? || other_move.lizard?))
  end
end

class Scissors < Move
  def >(other_move)
    (scissors? && (other_move.paper? || other_move.lizard?))
  end

  def <(other_move)
    (scissors? && (other_move.rock? || other_move.spock?))
  end
end

class Lizard < Move
  def >(other_move)
    (lizard? && (other_move.spock? || other_move.paper?))
  end

  def <(other_move)
    (lizard? && (other_move.scissors? || other_move.rock?))
  end
end

class Spock < Move
  def >(other_move)
    (spock? && (other_move.rock? || other_move.scissors?))
  end

  def <(other_move)
    (spock? && (other_move.paper? || other_move.lizard?))
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history, :human_move_test

  @@human_move_test = ''

  def initialize
    set_name
    @score = 0
    @move_history = []
  end

  def create_move(choice)
    self.move = Rock.new(choice) if choice == 'rock'
    self.move = Paper.new(choice) if choice == 'paper'
    self.move = Scissors.new(choice) if choice == 'scissors'
    self.move = Lizard.new(choice) if choice == 'lizard'
    self.move = Spock.new(choice) if choice == 'spock'
  end

  def increment_score
    @score += 1
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

  def choose
    choice = nil
    loop do
      puts "Choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Invlaid choice. Try again."
    end

    @@human_move_test = choice
    create_move(choice)
    @move_history << move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'WALL-E', 'C3PO', 'Terminator', 'Bender'].sample
  end

  def winning_move(human_move)
    case human_move
    when 'rock' then ['paper', 'spock'].sample
    when 'paper' then ['scissors', 'lizard'].sample
    when 'scissors' then ['rock', 'spock'].sample
    when 'lizard' then ['rock', 'scissors'].sample
    when 'spock' then ['paper', 'lizard'].sample
    end
  end

  def choose
    comp_choice = nil
    case name
    when 'R2D2' then comp_choice = Move::VALUES.sample
    when 'WALL-E' then comp_choice = ['rock', 'scissors'].sample
    when 'C3PO' then comp_choice = ['paper', 'lizard', 'spock'].sample
    when 'Terminator' then comp_choice = winning_move(@@human_move_test) # always wins
    when 'Bender' then comp_choice = 'lizard'
    end
    create_move(comp_choice)
    @move_history << move
  end
end

class RPSGame
  WINNING_SCORE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock/Paper/Scissors/Lizard/Spock, #{human.name}!"
    puts "First player to #{WINNING_SCORE} is the winner!"
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_overall_winner
    if human.score == WINNING_SCORE
      puts "#{human.name} is the winner!"
    elsif computer.score == WINNING_SCORE
      puts "#{computer.name} is the winner!"
    end
  end

  def display_move_history
    puts "Your moves:"
    human.move_history.each { |move| puts move }
    puts "#{computer.name}'s moves:"
    computer.move_history.each { |move| puts move }
  end

  def display_score
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def update_score
    if human.move > computer.move
      human.increment_score
    elsif human.move < computer.move
      computer.increment_score
    end
  end

  def next_round
    puts "Press enter to play next round."
    gets
  end

  def overall_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Please select y or n."
    end

    system 'clear'
    reset_score

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play
    system 'clear'
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        update_score
        display_score
        if overall_winner?
          display_overall_winner
          display_move_history
          break
        end
        next_round
        system 'clear'
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

system 'clear'
RPSGame.new.play

# To fix:
# Fix all rubocop complaints
#   - simplify methods and extract processses to methods
# Make move history more elegant - by round?
# disallow empty string as player name
# each move class should contain what each move beats - refactor accordingly
# individual class for each personality?
# make it easy to type options --- single letter choosers
# is terminator implementation wonky? - can it use last move array? Can fix
# if personalities have classes?
#   - add funny terminator text - secret move to beat him?
