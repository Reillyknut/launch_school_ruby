# # 1)
# class Machine
#   def start
#     self.flip_switch(:on)
#   end

#   def stop
#     self.flip_switch(:off)
#   end

#   def status
#     if switch == :on
#       puts 'on'
#     elsif switch == :off
#       puts 'off'
#     end 
#   end

#   private

#   attr_accessor :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# a = Machine.new
# p a.start
# p a.stop
# puts a.status


# # 2)
# class FixedArray
#   attr_reader :array

#   def initialize(size)
#     @size = size
#     @array = []
#     size.times { array << nil }
#   end

#   def [](num)
#     raise IndexError if num > @size
#     array[num]
#   end

#   def []=(idx, object)
#     raise IndexError if idx > @size
#     array[idx] = object
#   end

#   def to_a
#     array.to_a
#   end

#   def to_s
#     array.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end


# # 3)
# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
# end


# 4)
# class CircularQueue
#   attr_reader :size, :array, :end_index

#   def initialize(size)
#     @size = size
#     @array = Array.new(size)
#     @start_index = 0
#     @end_index = size - 1
#     @oldest_index = 0
#   end

#   def enqueue(num)
#     if !array.include?(nil)
#       array[@oldest_index] = num
#       @oldest_index += 1
#     else
#       array[@start_index] = num
#     end

#     @start_index += 1
#     if @start_index > end_index
#       @start_index = 0
#     end

#     if @oldest_index > end_index
#       @oldest_index = 0
#     end
#   end

#   def dequeue
#     removed_item = array[@oldest_index]
#     array[@oldest_index] = nil
#     @oldest_index += 1 if removed_item
#     if @oldest_index > end_index
#       @oldest_index = 0
#     end
#     removed_item
#   end
# end

### OR ###

# class CircularQueue
#   attr_reader :queue
#   def initialize(buffer)
#     @buffer = buffer
#     @queue = []
#   end

#   def enqueue(int)
#     @queue.shift if @queue.length == @buffer
#     @queue << int
#   end

#   def dequeue
#     @queue.shift
#   end
# end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil


# 5)
# class Minilang
#   ACTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

#   def initialize(commands)
#     @commands = commands.split
#     @register = 0
#     @stack = []
#     @commands.each do |command|
#       if command.to_i.to_s == command
#         n(command)
#         next
#       end
#       if ACTIONS.include?(command)
#         send(command.downcase)
#       else
#         raise "Invalid token: #{command}"
#       end
#     end
#   end

#   def n(num)
#     @register = num.to_i
#   end

#   def push
#     @stack << @register.to_i
#   end

#   def add
#     @register += @stack.pop
#   end

#   def sub
#     @register -= @stack.pop
#   end

#   def mult
#     @register *= @stack.pop
#   end

#   def div
#     @register /= @stack.pop
#   end

#   def mod
#     @register %= @stack.pop
#   end

#   def pop
#     raise "Empty stack!" if @stack.empty?
#     @register = @stack.pop
#   end

#   def print
#     puts @register
#   end
# end

# Minilang.new('PRINT')
# Minilang.new('5 PUSH 3 MULT PRINT')
# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT')
# Minilang.new('5 PUSH 10 PRINT POP PRINT')
# # Minilang.new('5 PUSH POP POP PRINT') # => should raise error
# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ')
# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ')
# # Minilang.new('-3 PUSH 5 XSUB PRINT') # => should raise error
# Minilang.new('-3 PUSH 5 SUB PRINT')
# Minilang.new('6 PUSH') # => prints nothing


# # 6)
# class GuessingGame
#   def initialize
#     @number = rand(1..100)
#     @guesses = 7
#     @guess = nil
#   end

#   def display_guesses_remaining
#     if @guesses == 1
#       puts "You have #{@guesses} guess remaining."
#     else
#       puts "You have #{@guesses} guesses remaining."
#     end
#   end

#   def enter_number
#     puts "Enter a number between 1 and 100:"
#     loop do
#       @guess = gets.chomp.to_i
#       break if (1..100).include?(@guess)
#       puts "Invalid guess. Enter a number between 1 and 100:"
#     end
#   end

#   def win?
#     @guess == @number
#   end

#   def display_win
#     puts "You won!"
#   end

#   def display_high_or_low
#     if @guess > @number
#       puts "Too high."
#     else
#       puts "Too low."
#     end
#   end

#   def display_loss
#     puts "You have no more guesses. You lost!"
#   end

#   def play
#     loop do
#       display_guesses_remaining
#       enter_number
#       if win?
#         display_win
#         break
#       end
#       display_high_or_low
#       @guesses -= 1
#       if @guesses == 0
#         display_loss
#         break
#       end
#     end
#     @number = rand(1..100)
#   end
# end

# game = GuessingGame.new
# game.play


# # 7)
# class GuessingGame
#   attr_reader :start_of_range, :end_of_range

#   def initialize(start_of_range, end_of_range)
#     @number = nil
#     @guesses = nil
#     @guess = nil
#     @start_of_range = start_of_range
#     @end_of_range = end_of_range
#   end

#   def display_guesses_remaining
#     if @guesses == 1
#       puts "You have #{@guesses} guess remaining."
#     else
#       puts "You have #{@guesses} guesses remaining."
#     end
#   end

#   def enter_number
#     puts "Enter a number between #{start_of_range} and #{end_of_range}:"
#     loop do
#       @guess = gets.chomp.to_i
#       break if (start_of_range..end_of_range).include?(@guess)
#       puts "Invalid guess. Enter a number between #{start_of_range} and #{end_of_range}:"
#     end
#   end

#   def win?
#     @guess == @number
#   end

#   def display_win
#     puts "You won!"
#   end

#   def display_high_or_low
#     if @guess > @number
#       puts "Too high."
#     else
#       puts "Too low."
#     end
#   end

#   def display_loss
#     puts "You have no more guesses. You lost!"
#   end

#   def play
#     @number = rand(start_of_range..end_of_range)
#     @guesses = Math.log2((start_of_range..end_of_range).size).to_i + 1
#     loop do
#       display_guesses_remaining
#       enter_number
#       if win?
#         display_win
#         break
#       end
#       display_high_or_low
#       @guesses -= 1
#       if @guesses == 0
#         display_loss
#         break
#       end
#     end
#   end
# end

# game = GuessingGame.new(501, 1500)
# game.play
# game.play


# 8)
class Card
  include Comparable
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = worth(rank)
  end

  def worth(rank)
    case rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else
      rank
    end
  end

  def <=>(other)
    self.value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8


# 9)
# implements Card class from 8
class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  def initialize
    @cards = all_cards.shuffle
  end

  def all_cards
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards
  end

  def draw
    if @cards.empty?
      @cards = all_cards.shuffle
    end
    @cards.pop
  end
end

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# puts drawn.count { |card| card.rank == 5 } == 4
# puts drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# puts drawn != drawn2


# 10)
# Include Card and Deck classes from the last two exercises.

require 'pry'

class PokerHand
  attr_reader :cards

  def initialize(deck)
    @cards = []
    5.times { @cards << deck.draw }
  end

  def print
    puts cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    sorted = cards.sort_by { |card| card.value }
    (sorted[0].rank == 10 &&
    sorted[1].rank == 'Jack' &&
    sorted[2].rank == 'Queen' &&
    sorted[3].rank == 'King' &&
    sorted[4].rank == 'Ace') &&
    flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush? # try the (:&) format
    cards.all? { |card| card.suit == 'Hearts'} ||
    cards.all? { |card| card.suit == 'Diamonds'} ||
    cards.all? { |card| card.suit == 'Spades'} || 
    cards.all? { |card| card.suit == 'Clubs' }
  end

  def straight?
    sorted = cards.sort_by { |card| card.value }
    sorted[1].value == sorted[0].value + 1 &&
    sorted[2].value == sorted[1].value + 1 &&
    sorted[3].value == sorted[2].value + 1 &&
    sorted[4].value == sorted[3].value + 1
  end

  def three_of_a_kind?
    cards.any? do |card|
      cards.count(card) == 3
    end
  end

  def two_pair?
  end

  def pair?
    cards.any? do |card|
      cards.count(card) == 2
    end
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'