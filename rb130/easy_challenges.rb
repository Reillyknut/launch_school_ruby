require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

# # 1)
# class Triangle
#   attr_reader :side1, :side2, :side3
#   attr_accessor :type

#   def initialize(side1, side2, side3)
#     @tri = [side1, side2, side3]
#     @side1 = side1
#     @side2 = side2
#     @side3 = side3
#     raise ArgumentError unless triangle?

#     @type = determine_type
#   end

#   def triangle?
#     @tri.all?(&:positive?) &&
#       side1 + side2 >= side3 &&
#       side1 + side3 >= side2 &&
#       side2 + side3 >= side1
#   end

#   def determine_type
#     if side1 == side2 && side2 == side3
#       'equilateral'
#     elsif side1 == side2 ||
#           side1 == side3 ||
#           side2 == side3
#       'isosceles'
#     else
#       'scalene'
#     end
#   end
# end


# class TriangleTest < Minitest::Test
#   def test_equilateral_equal_sides
#     triangle = Triangle.new(2, 2, 2)
#     assert_equal 'equilateral', triangle.determine_type
#   end

#   def test_larger_equilateral_equal_sides
#     triangle = Triangle.new(10, 10, 10)
#     assert_equal 'equilateral', triangle.determine_type
#   end

#   def test_isosceles_last_two_sides_equal
#     triangle = Triangle.new(3, 4, 4)
#     assert_equal 'isosceles', triangle.determine_type
#   end

#   def test_isosceles_first_last_sides_equal
#     triangle = Triangle.new(4, 3, 4)
#     assert_equal 'isosceles', triangle.determine_type
#   end

#   def test_isosceles_first_two_sides_equal
#     triangle = Triangle.new(4, 4, 3)
#     assert_equal 'isosceles', triangle.determine_type
#   end

#   def test_isosceles_exactly_two_sides_equal
#     triangle = Triangle.new(10, 10, 2)
#     assert_equal 'isosceles', triangle.determine_type
#   end

#   def test_scalene_no_equal_sides
#     triangle = Triangle.new(3, 4, 5)
#     assert_equal 'scalene', triangle.determine_type
#   end

#   def test_scalene_larger_no_equal_sides
#     triangle = Triangle.new(10, 11, 12)
#     assert_equal 'scalene', triangle.determine_type
#   end

#   def test_scalene_no_equal_sides_descending
#     triangle = Triangle.new(5, 4, 2)
#     assert_equal 'scalene', triangle.determine_type
#   end

#   def test_small_triangles_are_legal
#     triangle = Triangle.new(0.4, 0.6, 0.3)
#     assert_equal 'scalene', triangle.determine_type
#   end

#   def test_no_size_is_illegal
#     assert_raises(ArgumentError) do
#       triangle = Triangle.new(0, 0, 0)
#     end
#   end

#   def test_negative_size_is_illegal
#     assert_raises(ArgumentError) do
#       triangle = Triangle.new(3, 4, -5)
#     end
#   end

#   def test_size_inequality_is_illegal
#     assert_raises(ArgumentError) do
#       triangle = Triangle.new(1, 1, 3)
#     end
#   end

#   def test_size_inequality_is_illegal_2
#     assert_raises(ArgumentError) do
#       triangle = Triangle.new(7, 3, 2)
#     end
#   end

#   def test_size_inequality_is_illegal_3
#     assert_raises(ArgumentError) do
#       triangle = Triangle.new(10, 1, 3)
#     end
#   end
# end


# # 2)
# # P
# # Given two strings of DNA strands, find the hamming distance. This the difference
# # in "letters" of the DNA strands. If corresponding letters are the same, they do
# # not add to the distance. If one is longer than the other, match them up from the
# # beginning up to the length of the shorter strand to match them up and compare.

# # E
# # 'GAGCCTACTAACGGGAT' compared to the below == 7
# # 'CATCGTAATGACGGCCT'
# # edge cases: what if both 0? input validation? Only allow GCAT?

# # D
# # could use string since string uses indeces - array may be better?

# # A
# # Find shortest string and the length of shortest string
# #   - any letters after the shortest string index should be discarded/disregarded
# # Loop through one of the strings and compare each index with the corresponding
# # index of the other string.
# # Any time there is a letter that does not match, increase a count by 1
# # return the count

# class Hamming
#   attr_reader :string, :length

#   def initialize(string)
#     @string = string
#     @length = string.length
#   end

#   def <(other)
#     length < other.length
#   end

#   def ==(other)
#     length == other.length
#   end

#   def shorter_string(other)
#     if self.<(other)
#       self
#     else
#       other
#     end
#   end

#   def hamming_distance(other)
#     index = 0
#     count = 0
#     until index == shorter_string(other).length
#       count += 1 if string[index] != other[index]
#       index += 1
#     end
#     count
#   end
# end

# class HammingTest < Minitest::Test
#   def test_no_difference_between_empty_strands
#     assert_equal 0, Hamming.new('').hamming_distance('')
#   end

#   def test_no_difference_between_identical_strands
#     assert_equal 0, Hamming.new('GGACTGA').hamming_distance('GGACTGA')
#   end

#   def test_complete_hamming_distance_in_small_strand
#     assert_equal 3, Hamming.new('ACT').hamming_distance('GGA')
#   end

#   def test_hamming_distance_in_off_by_one_strand
#     strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
#     distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
#     assert_equal 19, Hamming.new(strand).hamming_distance(distance)
#   end

#   def test_small_hamming_distance_in_middle_somewhere
#     assert_equal 1, Hamming.new('GGACG').hamming_distance('GGTCG')
#   end

#   def test_larger_distance
#     assert_equal 2, Hamming.new('ACCAGGG').hamming_distance('ACTATGG')
#   end

#   def test_ignores_extra_length_on_other_strand_when_longer
#     assert_equal 3, Hamming.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
#   end

#   def test_ignores_extra_length_on_original_strand_when_longer
#     strand = 'GACTACGGACAGGGTAGGGAAT'
#     distance = 'GACATCGCACACC'
#     assert_equal 5, Hamming.new(strand).hamming_distance(distance)
#   end

#   def test_does_not_actually_shorten_original_strand
#     dna = Hamming.new('AGACAACAGCCAGCCGCCGGATT')
#     assert_equal 1, dna.hamming_distance('AGGCAA')
#     assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
#     assert_equal 1, dna.hamming_distance('AGG')
#   end
# end


# # 3)
# # P
# # Given an integer, convert to roman numeral
# # I = 1
# # v = 5
# # X = 10
# # L = 50
# # C = 100
# # D = 500
# # M = 1000
# # When a letter comes before one that represents a larger number, it means to subtract

# # E - do we need to make sure the numeral given is valid?
# # D - strings - need a way to figure out if letters come before or after certain ones

# # A
# # create constant of a hash with the integer each letter corresponds to
# # Given a number, find out what numeral to start with
#   # starting from 1000, then 500, 100, 50, etc, use % to divide
#     # if the result is the given number, go to the next number down until the answer is different
#     # once the answer is different, find out how many times the number (100, or 50 or whatever it is) goes into it
#       # this is the amount of the corresponding letters that will be output
#         # add each of these to an empty string we initialize at the beginning ***
#     # subtract number from the original one and repeat process
#   # ***** need way to find 4s and 9s: ---- throw 4, 9, 40, 90, 400, 900 in constant
#     # if num = 4 or 9 when dividing normally, look at letter that is one bigger than the current one and put both in
# # return the string from beginning

# class RomanNumeral
#   NUMERALS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
#                100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X',
#                9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }.freeze

#   def initialize(num)
#     @num = num
#     @string = ''
#     @last_numeral = nil
#   end

#   def to_roman
#     return 'I' if @num == 1

#     NUMERALS.each do |divisor, rom_num|
#       next if @num % divisor == @num

#       amount = @num / divisor
#       @string << rom_num * amount
#       @num -= (amount * divisor)
#     end
#     @string
#   end
# end

# class RomanNumeralsTest < Minitest::Test
#   def test_1
#     number = RomanNumeral.new(1)
#     assert_equal 'I', number.to_roman
#   end

#   def test_2
#     number = RomanNumeral.new(2)
#     assert_equal 'II', number.to_roman
#   end

#   def test_3
#     number = RomanNumeral.new(3)
#     assert_equal 'III', number.to_roman
#   end

#   def test_4
#     number = RomanNumeral.new(4)
#     assert_equal 'IV', number.to_roman
#   end

#   def test_5
#     number = RomanNumeral.new(5)
#     assert_equal 'V', number.to_roman
#   end

#   def test_6
#     number = RomanNumeral.new(6)
#     assert_equal 'VI', number.to_roman
#   end

#   def test_9
#     number = RomanNumeral.new(9)
#     assert_equal 'IX', number.to_roman
#   end

#   def test_27
#     number = RomanNumeral.new(27)
#     assert_equal 'XXVII', number.to_roman
#   end

#   def test_48
#     number = RomanNumeral.new(48)
#     assert_equal 'XLVIII', number.to_roman
#   end

#   def test_59
#     number = RomanNumeral.new(59)
#     assert_equal 'LIX', number.to_roman
#   end

#   def test_93
#     number = RomanNumeral.new(93)
#     assert_equal 'XCIII', number.to_roman
#   end

#   def test_141
#     number = RomanNumeral.new(141)
#     assert_equal 'CXLI', number.to_roman
#   end

#   def test_163
#     number = RomanNumeral.new(163)
#     assert_equal 'CLXIII', number.to_roman
#   end

#   def test_402
#     number = RomanNumeral.new(402)
#     assert_equal 'CDII', number.to_roman
#   end

#   def test_575
#     number = RomanNumeral.new(575)
#     assert_equal 'DLXXV', number.to_roman
#   end

#   def test_911
#     number = RomanNumeral.new(911)
#     assert_equal 'CMXI', number.to_roman
#   end

#   def test_1024
#     number = RomanNumeral.new(1024)
#     assert_equal 'MXXIV', number.to_roman
#   end

#   def test_3000
#     number = RomanNumeral.new(3000)
#     assert_equal 'MMM', number.to_roman
#   end
# end


# # 4)
# # P
# # input: word and a list of possible anagrams
# # output: array containing anagrams of given word out of list given
# # - empty array if none/if no list is given

# # E - empty string? Does case matter? - yes

# # D - strings and array of individual letters for comparison

# # A
# # create empty array
# # split given word into individual characters and sort them
# # go through each word in the given list
#   # for each word, split into individual characters and sort and join
#   # check if the sorted word is equal to the given word
#   # if so, put it into array from beginning
# # return word array

# class Anagram
#   def initialize(word)
#     @word = word
#     @arr = []
#   end

#   def match(list)
#     sorted_word = @word.downcase.chars.sort.join
#     list.each do |string|
#       next if string.downcase == @word.downcase

#       sorted_str = string.downcase.chars.sort.join
#       @arr << string if sorted_str == sorted_word
#     end
#     @arr
#   end
# end

# class AnagramTest < Minitest::Test
#   def test_no_matches
#     detector = Anagram.new('diaper')
#     assert_equal [], detector.match(%w(hello world zombies pants))
#   end

#   def test_detect_simple_anagram
#     # skip
#     detector = Anagram.new('ant')
#     anagrams = detector.match(%w(tan stand at))
#     assert_equal ['tan'], anagrams
#   end

#   def test_detect_multiple_anagrams
#     # skip
#     detector = Anagram.new('master')
#     anagrams = detector.match(%w(stream pigeon maters))
#     assert_equal %w(maters stream), anagrams.sort
#   end

#   def test_does_not_confuse_different_duplicates
#     # skip
#     detector = Anagram.new('galea')
#     assert_equal [], detector.match(['eagle'])
#   end

#   def test_identical_word_is_not_anagram
#     # skip
#     detector = Anagram.new('corn')
#     anagrams = detector.match %w(corn dark Corn rank CORN cron park)
#     assert_equal ['cron'], anagrams
#   end

#   def test_eliminate_anagrams_with_same_checksum
#     # skip
#     detector = Anagram.new('mass')
#     assert_equal [], detector.match(['last'])
#   end

#   def test_eliminate_anagram_subsets
#     # skip
#     detector = Anagram.new('good')
#     assert_equal [], detector.match(%w(dog goody))
#   end

#   def test_detect_anagram
#     # skip
#     detector = Anagram.new('listen')
#     anagrams = detector.match %w(enlists google inlets banana)
#     assert_equal ['inlets'], anagrams
#   end

#   def test_multiple_anagrams
#     # skip
#     detector = Anagram.new('allergy')
#     anagrams =
#       detector.match %w( gallery ballerina regally clergy largely leading)
#     assert_equal %w(gallery largely regally), anagrams.sort
#   end

#   def test_anagrams_are_case_insensitive
#     # skip
#     detector = Anagram.new('Orchestra')
#     anagrams = detector.match %w(cashregister Carthorse radishes)
#     assert_equal ['Carthorse'], anagrams
#   end
# end


# # 5)
# # P
# # input: a single word as a string
# # output: the given words scrabble score - letter scores below
# # aeioulnrst - 1
# # dg - 2
# # bcmp - 3
# # fhvwy - 4
# # k - 5
# # jx - 8
# # qz - 10

# # E - strip blanks and non-word chars - also make all chars same case
# # D - string and array of characters - may want to hash for scoring
# # A
# # Create scoring constant with a hash containing all of the letters and their number score
# # Create running score as instance variable - set to 0
# # For the given word, lowercase it and split into individual chars --- strip all other
#   # iterate through these chars - for each char iterate through the constant
#     # if the char is included in the value of any of the keys, add that keys value to the running score
#     # repeat for all chars in the given word
# # return the score

# class Scrabble
#   SCORING = { 1 => 'aeioulnrst', 2 => 'dg', 3 => 'bcmp',
#               4 => 'fhvwy', 5 => 'k', 8 => 'jx', 10 => 'qz' }.freeze

#   def initialize(word)
#     word = '' if word.nil?
#     @word = word.downcase.strip
#     @score = 0
#   end

#   def score
#     @word.chars.each do |char|
#       SCORING.each { |k, v| @score += k if v.include?(char) }
#     end
#     @score
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end

# class ScrabbleTest < Minitest::Test
#   def test_empty_word_scores_zero
#     assert_equal 0, Scrabble.new('').score
#   end

#   def test_whitespace_scores_zero
#     # skip
#     assert_equal 0, Scrabble.new(" \t\n").score
#   end

#   def test_nil_scores_zero
#     # skip
#     assert_equal 0, Scrabble.new(nil).score
#   end

#   def test_scores_very_short_word
#     # skip
#     assert_equal 1, Scrabble.new('a').score
#   end

#   def test_scores_other_very_short_word
#     # skip
#     assert_equal 4, Scrabble.new('f').score
#   end

#   def test_simple_word_scores_the_number_of_letters
#     # skip
#     assert_equal 6, Scrabble.new('street').score
#   end

#   def test_complicated_word_scores_more
#     # skip
#     assert_equal 22, Scrabble.new('quirky').score
#   end

#   def test_scores_are_case_insensitive
#     # skip
#     assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
#   end

#   def test_convenient_scoring
#     # skip
#     assert_equal 13, Scrabble.score('alacrity')
#   end
# end


# # 6)
# # input: integer
# # output: whether or not the number is perfect, abundant, or deficient

# # perfect - aliquot sum is equal to original number
# # abundant - aliquot sum is greater than original number
# # deficient - aliquot sum is less than original number
# # aliquot sum - sum of positive divisors excluding the number itself

# # ex: 6 is perfect since divisors are 1, 2, and 3 which add to 6
# # all prime numbers are deficient since only divisor is 1

# # what is 0?
# # should this be able to take negative numbers? - no => raises StandardError on initialization
# # float numbers?

# # Data structure: integers

# # Algorithm:
# # Get all divisors for the given number excluding the given number
# #   create a sum variable and set to 0
# #   from 1 up to the given number - 1, if the given number % loop number == 0, add it to the sum variable
# # Sum all divisors
# # Check if sum is higher, equal to, or lower than given number and return corresponding number type

# class PerfectNumber
#   def self.classify(number)
#     raise StandardError if number <= 0

#     sum = 0
#     1.upto(number - 1) do |num|
#       sum += num if (number % num).zero?
#     end

#     if sum == number then 'perfect'
#     elsif sum < number then 'deficient'
#     else 'abundant' end
#   end
# end

# class PerfectNumberTest < Minitest::Test
#   def test_initialize_perfect_number
#     assert_raises StandardError do
#       PerfectNumber.classify(-1)
#     end
#   end

#   def test_classify_deficient
#     assert_equal 'deficient', PerfectNumber.classify(13)
#   end

#   def test_classify_perfect
#     assert_equal 'perfect', PerfectNumber.classify(28)
#   end

#   def test_classify_abundant
#     assert_equal 'abundant', PerfectNumber.classify(12)
#   end
# end


# 7)
# input: octal input string
# output: decimal output of the input string

# decimal - each digit gets multiplied by 10^n-1 where n is the place (ones place, tens place, etc) and added
# octal is the same, but with 8^n-1 instead
# 233 from octal to decimal --> 2*8^2 + 3*8^1 + 3*8^0 = 128 + 24 + 3 = 155
# any invalid input should be the same as octal 0
# leading zeroes are ignored
# anything with 8 or 9 is 0
# octal input that has string defaults to 0

# Data Structure: will need to iterate through each digit in the number, probably need to represent each digit in
# an array. Need to have a way of telling which place we are in - can probably use length to calculate n-1

# Algorithm:

# split numbers into individual digits (given a string so split into chars and then to_i on each)
# create running sum = 0
# set places (n) to length of the number - 1
# loop through all numbers
# multiply each number by (8^n) and decrement n by 1 each loop --> add to sum
# return the sum

# class Octal
#   def initialize(number)
#     number = '0' if number.include?('8') ||
#                     number.include?('9') ||
#                     number.match(/\D/)

#     @number = number.to_i.to_s.chars.map(&:to_i)
#   end

#   def to_decimal
#     exponent = @number.length - 1
#     sum = 0
#     @number.each do |digit|
#       sum += (digit * (8**exponent))
#       exponent -= 1
#     end

#     sum
#   end
# end

# class OctalTest < Minitest::Test
#   def test_octal_1_is_decimal_1
#     assert_equal 1, Octal.new('1').to_decimal
#   end

#   def test_octal_10_is_decimal_8
#     # skip
#     assert_equal 8, Octal.new('10').to_decimal
#   end

#   def test_octal_17_is_decimal_15
#     # skip
#     assert_equal 15, Octal.new('17').to_decimal
#   end

#   def test_octal_11_is_decimal_9
#     # skip
#     assert_equal 9, Octal.new('11').to_decimal
#   end

#   def test_octal_130_is_decimal_88
#     # skip
#     assert_equal 88, Octal.new('130').to_decimal
#   end

#   def test_octal_2047_is_decimal_1063
#     # skip
#     assert_equal 1063, Octal.new('2047').to_decimal
#   end

#   def test_octal_7777_is_decimal_4095
#     # skip
#     assert_equal 4095, Octal.new('7777').to_decimal
#   end

#   def test_octal_1234567_is_decimal_342391
#     # skip
#     assert_equal 342_391, Octal.new('1234567').to_decimal
#   end

#   def test_invalid_octal_is_decimal_0
#     # skip
#     assert_equal 0, Octal.new('carrot').to_decimal
#   end

#   def test_8_is_seen_as_invalid_and_returns_0
#     # skip
#     assert_equal 0, Octal.new('8').to_decimal
#   end

#   def test_9_is_seen_as_invalid_and_returns_0
#     # skip
#     assert_equal 0, Octal.new('9').to_decimal
#   end

#   def test_6789_is_seen_as_invalid_and_returns_0
#     # skip
#     assert_equal 0, Octal.new('6789').to_decimal
#   end

#   def test_abc1z_is_seen_as_invalid_and_returns_0
#     # skip
#     assert_equal 0, Octal.new('abc1z').to_decimal
#   end

#   def test_valid_octal_formatted_string_011_is_decimal_9
#     # skip
#     assert_equal 9, Octal.new('011').to_decimal
#   end

#   def test_234abc_is_seen_as_invalid_and_returns_0
#     # skip
#     assert_equal 0, Octal.new('234abc').to_decimal
#   end
# end


# # 8)
# # input: natural number and a set of one or more other numbers
# # output: sum of all multiples of nums in the set less than the first number
# # - so take all numbers up to the given number that are multiples of the given set
# # use 3 and 5 by default if no set is given

# # Examples:
# # if the number is 20 and the set is 3 and 5, take all numbers less than 20
# # that are multiples of either 3 or 5 (including 3 and 5) and sum them

# # Data Structures: integers and arrays to hold the multiples to sum later

# # Algorithm:
# # Make sure default set is 3 and 5 - put all arguments into a set array - if empty put 3 and 5 in
# # create empty array to hold multiples
# # from 1 up to the given number - 1, if number % (any number in the set) == 0, add it to the multiples array
#   # if it already exists don't add it (could also just run uniq on the array at the end)
# # return sum of multiples array

# class SumOfMultiples
#   def initialize(*set)
#     @set = []
#     set.each { |arg| @set << arg }
#     @set = [3, 5] if @set.empty?
#   end

#   def self.to(number)
#     SumOfMultiples.new.to(number)
#   end

#   def to(number)
#     multiples = []
#     1.upto(number - 1) do |num|
#       multiples << num if @set.any? { |divisor| (num % divisor).zero? }
#     end
#     multiples.sum
#   end
# end

# class SumTest < Minitest::Test
#   def test_sum_to_1
#     assert_equal 0, SumOfMultiples.to(1)
#   end

#   def test_sum_to_3
#     # skip
#     assert_equal 3, SumOfMultiples.to(4)
#   end

#   def test_sum_to_10
#     # skip
#     assert_equal 23, SumOfMultiples.to(10)
#   end

#   def test_sum_to_100
#     # skip
#     assert_equal 2_318, SumOfMultiples.to(100)
#   end

#   def test_sum_to_1000
#     # skip
#     assert_equal 233_168, SumOfMultiples.to(1000)
#   end

#   def test_configurable_7_13_17_to_20
#     # skip
#     assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
#   end

#   def test_configurable_4_6_to_15
#     # skip
#     assert_equal 30, SumOfMultiples.new(4, 6).to(15)
#   end

#   def test_configurable_5_6_8_to_150
#     # skip
#     assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
#   end

#   def test_configurable_43_47_to_10000
#     # skip
#     assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
#   end
# end


# 9)
# input: verse to start at and optional argument of verse to end at
# output: verse or verses of the 99 bottles of beer song
# 0 has a special verse and resets at 99

# validate for negative numbers?
# Data Structures: string and int

# Algorithm:

# Set default end verse to the start verse if none is given
# create empty array for lyrics
# loop downwards until start verse is less than the end verse
# with line breaks after each number
# each verse is at least two lines with the second line being 1 less bottle
# if the first line is supposed to use number zero, the second line should reset to 99
# special case for when first line is 2, 1 or 0 (1 bottle vs bottles)
# join each duo together with a line break
# lyrics method returns the whole song from 99 to 0

# class BeerSong
#   def self.verse(start_verse)
#     BeerSong.verses(start_verse, start_verse)
#   end

#   def self.verses(start_verse, end_verse)
#     lyrics = []
#     until start_verse < end_verse
#       if start_verse == 2
#         lyrics << "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#         "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#       elsif start_verse == 1
#         lyrics << "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#         "Take it down and pass it around, no more bottles of beer on the wall.\n"
#       elsif start_verse.zero?
#         lyrics << "No more bottles of beer on the wall, no more bottles of beer.\n" \
#         "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#       else
#         lyrics << "#{start_verse} bottles of beer on the wall, #{start_verse} bottles of beer.\n" \
#         "Take one down and pass it around, #{start_verse - 1} bottles of beer on the wall.\n"
#       end
#       start_verse -= 1
#     end
#     lyrics.join("\n")
#   end

#   def self.lyrics
#     BeerSong.verses(99, 0)
#   end
# end

# # rubocop:disable Metrics/LineLength
# class BeerSongTest < Minitest::Test
#   def test_the_first_verse
#     expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
#       "Take one down and pass it around, 98 bottles of beer on the wall.\n"
#     assert_equal expected, BeerSong.verse(99)
#   end

#   def test_another_verse
#     expected = "3 bottles of beer on the wall, 3 bottles of beer.\n" \
#       "Take one down and pass it around, 2 bottles of beer on the wall.\n"
#     assert_equal expected, BeerSong.verse(3)
#   end

#   def test_verse_2
#     expected = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#       "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#     assert_equal expected, BeerSong.verse(2)
#   end

#   def test_verse_1
#     expected = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"
#     assert_equal expected, BeerSong.verse(1)
#   end

#   def test_verse_0
#     expected = "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     assert_equal expected, BeerSong.verse(0)
#   end

#   def test_a_couple_verses
#     expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
#       "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
#       "\n" \
#       "98 bottles of beer on the wall, 98 bottles of beer.\n" \
#       "Take one down and pass it around, 97 bottles of beer on the wall.\n"
#     assert_equal expected, BeerSong.verses(99, 98)
#   end

#   def test_a_few_verses
#     expected = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#       "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
#       "\n" \
#       "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n" \
#       "\n" \
#       "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     assert_equal expected, BeerSong.verses(2, 0)
#   end

#     def test_the_whole_song # rubocop:disable Metrics/MethodLength
#     expected = <<-SONG
# 99 bottles of beer on the wall, 99 bottles of beer.
# Take one down and pass it around, 98 bottles of beer on the wall.

# 98 bottles of beer on the wall, 98 bottles of beer.
# Take one down and pass it around, 97 bottles of beer on the wall.

# 97 bottles of beer on the wall, 97 bottles of beer.
# Take one down and pass it around, 96 bottles of beer on the wall.

# 96 bottles of beer on the wall, 96 bottles of beer.
# Take one down and pass it around, 95 bottles of beer on the wall.

# 95 bottles of beer on the wall, 95 bottles of beer.
# Take one down and pass it around, 94 bottles of beer on the wall.

# 94 bottles of beer on the wall, 94 bottles of beer.
# Take one down and pass it around, 93 bottles of beer on the wall.

# 93 bottles of beer on the wall, 93 bottles of beer.
# Take one down and pass it around, 92 bottles of beer on the wall.

# 92 bottles of beer on the wall, 92 bottles of beer.
# Take one down and pass it around, 91 bottles of beer on the wall.

# 91 bottles of beer on the wall, 91 bottles of beer.
# Take one down and pass it around, 90 bottles of beer on the wall.

# 90 bottles of beer on the wall, 90 bottles of beer.
# Take one down and pass it around, 89 bottles of beer on the wall.

# 89 bottles of beer on the wall, 89 bottles of beer.
# Take one down and pass it around, 88 bottles of beer on the wall.

# 88 bottles of beer on the wall, 88 bottles of beer.
# Take one down and pass it around, 87 bottles of beer on the wall.

# 87 bottles of beer on the wall, 87 bottles of beer.
# Take one down and pass it around, 86 bottles of beer on the wall.

# 86 bottles of beer on the wall, 86 bottles of beer.
# Take one down and pass it around, 85 bottles of beer on the wall.

# 85 bottles of beer on the wall, 85 bottles of beer.
# Take one down and pass it around, 84 bottles of beer on the wall.

# 84 bottles of beer on the wall, 84 bottles of beer.
# Take one down and pass it around, 83 bottles of beer on the wall.

# 83 bottles of beer on the wall, 83 bottles of beer.
# Take one down and pass it around, 82 bottles of beer on the wall.

# 82 bottles of beer on the wall, 82 bottles of beer.
# Take one down and pass it around, 81 bottles of beer on the wall.

# 81 bottles of beer on the wall, 81 bottles of beer.
# Take one down and pass it around, 80 bottles of beer on the wall.

# 80 bottles of beer on the wall, 80 bottles of beer.
# Take one down and pass it around, 79 bottles of beer on the wall.

# 79 bottles of beer on the wall, 79 bottles of beer.
# Take one down and pass it around, 78 bottles of beer on the wall.

# 78 bottles of beer on the wall, 78 bottles of beer.
# Take one down and pass it around, 77 bottles of beer on the wall.

# 77 bottles of beer on the wall, 77 bottles of beer.
# Take one down and pass it around, 76 bottles of beer on the wall.

# 76 bottles of beer on the wall, 76 bottles of beer.
# Take one down and pass it around, 75 bottles of beer on the wall.

# 75 bottles of beer on the wall, 75 bottles of beer.
# Take one down and pass it around, 74 bottles of beer on the wall.

# 74 bottles of beer on the wall, 74 bottles of beer.
# Take one down and pass it around, 73 bottles of beer on the wall.

# 73 bottles of beer on the wall, 73 bottles of beer.
# Take one down and pass it around, 72 bottles of beer on the wall.

# 72 bottles of beer on the wall, 72 bottles of beer.
# Take one down and pass it around, 71 bottles of beer on the wall.

# 71 bottles of beer on the wall, 71 bottles of beer.
# Take one down and pass it around, 70 bottles of beer on the wall.

# 70 bottles of beer on the wall, 70 bottles of beer.
# Take one down and pass it around, 69 bottles of beer on the wall.

# 69 bottles of beer on the wall, 69 bottles of beer.
# Take one down and pass it around, 68 bottles of beer on the wall.

# 68 bottles of beer on the wall, 68 bottles of beer.
# Take one down and pass it around, 67 bottles of beer on the wall.

# 67 bottles of beer on the wall, 67 bottles of beer.
# Take one down and pass it around, 66 bottles of beer on the wall.

# 66 bottles of beer on the wall, 66 bottles of beer.
# Take one down and pass it around, 65 bottles of beer on the wall.

# 65 bottles of beer on the wall, 65 bottles of beer.
# Take one down and pass it around, 64 bottles of beer on the wall.

# 64 bottles of beer on the wall, 64 bottles of beer.
# Take one down and pass it around, 63 bottles of beer on the wall.

# 63 bottles of beer on the wall, 63 bottles of beer.
# Take one down and pass it around, 62 bottles of beer on the wall.

# 62 bottles of beer on the wall, 62 bottles of beer.
# Take one down and pass it around, 61 bottles of beer on the wall.

# 61 bottles of beer on the wall, 61 bottles of beer.
# Take one down and pass it around, 60 bottles of beer on the wall.

# 60 bottles of beer on the wall, 60 bottles of beer.
# Take one down and pass it around, 59 bottles of beer on the wall.

# 59 bottles of beer on the wall, 59 bottles of beer.
# Take one down and pass it around, 58 bottles of beer on the wall.

# 58 bottles of beer on the wall, 58 bottles of beer.
# Take one down and pass it around, 57 bottles of beer on the wall.

# 57 bottles of beer on the wall, 57 bottles of beer.
# Take one down and pass it around, 56 bottles of beer on the wall.

# 56 bottles of beer on the wall, 56 bottles of beer.
# Take one down and pass it around, 55 bottles of beer on the wall.

# 55 bottles of beer on the wall, 55 bottles of beer.
# Take one down and pass it around, 54 bottles of beer on the wall.

# 54 bottles of beer on the wall, 54 bottles of beer.
# Take one down and pass it around, 53 bottles of beer on the wall.

# 53 bottles of beer on the wall, 53 bottles of beer.
# Take one down and pass it around, 52 bottles of beer on the wall.

# 52 bottles of beer on the wall, 52 bottles of beer.
# Take one down and pass it around, 51 bottles of beer on the wall.

# 51 bottles of beer on the wall, 51 bottles of beer.
# Take one down and pass it around, 50 bottles of beer on the wall.

# 50 bottles of beer on the wall, 50 bottles of beer.
# Take one down and pass it around, 49 bottles of beer on the wall.

# 49 bottles of beer on the wall, 49 bottles of beer.
# Take one down and pass it around, 48 bottles of beer on the wall.

# 48 bottles of beer on the wall, 48 bottles of beer.
# Take one down and pass it around, 47 bottles of beer on the wall.

# 47 bottles of beer on the wall, 47 bottles of beer.
# Take one down and pass it around, 46 bottles of beer on the wall.

# 46 bottles of beer on the wall, 46 bottles of beer.
# Take one down and pass it around, 45 bottles of beer on the wall.

# 45 bottles of beer on the wall, 45 bottles of beer.
# Take one down and pass it around, 44 bottles of beer on the wall.

# 44 bottles of beer on the wall, 44 bottles of beer.
# Take one down and pass it around, 43 bottles of beer on the wall.

# 43 bottles of beer on the wall, 43 bottles of beer.
# Take one down and pass it around, 42 bottles of beer on the wall.

# 42 bottles of beer on the wall, 42 bottles of beer.
# Take one down and pass it around, 41 bottles of beer on the wall.

# 41 bottles of beer on the wall, 41 bottles of beer.
# Take one down and pass it around, 40 bottles of beer on the wall.

# 40 bottles of beer on the wall, 40 bottles of beer.
# Take one down and pass it around, 39 bottles of beer on the wall.

# 39 bottles of beer on the wall, 39 bottles of beer.
# Take one down and pass it around, 38 bottles of beer on the wall.

# 38 bottles of beer on the wall, 38 bottles of beer.
# Take one down and pass it around, 37 bottles of beer on the wall.

# 37 bottles of beer on the wall, 37 bottles of beer.
# Take one down and pass it around, 36 bottles of beer on the wall.

# 36 bottles of beer on the wall, 36 bottles of beer.
# Take one down and pass it around, 35 bottles of beer on the wall.

# 35 bottles of beer on the wall, 35 bottles of beer.
# Take one down and pass it around, 34 bottles of beer on the wall.

# 34 bottles of beer on the wall, 34 bottles of beer.
# Take one down and pass it around, 33 bottles of beer on the wall.

# 33 bottles of beer on the wall, 33 bottles of beer.
# Take one down and pass it around, 32 bottles of beer on the wall.

# 32 bottles of beer on the wall, 32 bottles of beer.
# Take one down and pass it around, 31 bottles of beer on the wall.

# 31 bottles of beer on the wall, 31 bottles of beer.
# Take one down and pass it around, 30 bottles of beer on the wall.

# 30 bottles of beer on the wall, 30 bottles of beer.
# Take one down and pass it around, 29 bottles of beer on the wall.

# 29 bottles of beer on the wall, 29 bottles of beer.
# Take one down and pass it around, 28 bottles of beer on the wall.

# 28 bottles of beer on the wall, 28 bottles of beer.
# Take one down and pass it around, 27 bottles of beer on the wall.

# 27 bottles of beer on the wall, 27 bottles of beer.
# Take one down and pass it around, 26 bottles of beer on the wall.

# 26 bottles of beer on the wall, 26 bottles of beer.
# Take one down and pass it around, 25 bottles of beer on the wall.

# 25 bottles of beer on the wall, 25 bottles of beer.
# Take one down and pass it around, 24 bottles of beer on the wall.

# 24 bottles of beer on the wall, 24 bottles of beer.
# Take one down and pass it around, 23 bottles of beer on the wall.

# 23 bottles of beer on the wall, 23 bottles of beer.
# Take one down and pass it around, 22 bottles of beer on the wall.

# 22 bottles of beer on the wall, 22 bottles of beer.
# Take one down and pass it around, 21 bottles of beer on the wall.

# 21 bottles of beer on the wall, 21 bottles of beer.
# Take one down and pass it around, 20 bottles of beer on the wall.

# 20 bottles of beer on the wall, 20 bottles of beer.
# Take one down and pass it around, 19 bottles of beer on the wall.

# 19 bottles of beer on the wall, 19 bottles of beer.
# Take one down and pass it around, 18 bottles of beer on the wall.

# 18 bottles of beer on the wall, 18 bottles of beer.
# Take one down and pass it around, 17 bottles of beer on the wall.

# 17 bottles of beer on the wall, 17 bottles of beer.
# Take one down and pass it around, 16 bottles of beer on the wall.

# 16 bottles of beer on the wall, 16 bottles of beer.
# Take one down and pass it around, 15 bottles of beer on the wall.

# 15 bottles of beer on the wall, 15 bottles of beer.
# Take one down and pass it around, 14 bottles of beer on the wall.

# 14 bottles of beer on the wall, 14 bottles of beer.
# Take one down and pass it around, 13 bottles of beer on the wall.

# 13 bottles of beer on the wall, 13 bottles of beer.
# Take one down and pass it around, 12 bottles of beer on the wall.

# 12 bottles of beer on the wall, 12 bottles of beer.
# Take one down and pass it around, 11 bottles of beer on the wall.

# 11 bottles of beer on the wall, 11 bottles of beer.
# Take one down and pass it around, 10 bottles of beer on the wall.

# 10 bottles of beer on the wall, 10 bottles of beer.
# Take one down and pass it around, 9 bottles of beer on the wall.

# 9 bottles of beer on the wall, 9 bottles of beer.
# Take one down and pass it around, 8 bottles of beer on the wall.

# 8 bottles of beer on the wall, 8 bottles of beer.
# Take one down and pass it around, 7 bottles of beer on the wall.

# 7 bottles of beer on the wall, 7 bottles of beer.
# Take one down and pass it around, 6 bottles of beer on the wall.

# 6 bottles of beer on the wall, 6 bottles of beer.
# Take one down and pass it around, 5 bottles of beer on the wall.

# 5 bottles of beer on the wall, 5 bottles of beer.
# Take one down and pass it around, 4 bottles of beer on the wall.

# 4 bottles of beer on the wall, 4 bottles of beer.
# Take one down and pass it around, 3 bottles of beer on the wall.

# 3 bottles of beer on the wall, 3 bottles of beer.
# Take one down and pass it around, 2 bottles of beer on the wall.

# 2 bottles of beer on the wall, 2 bottles of beer.
# Take one down and pass it around, 1 bottle of beer on the wall.

# 1 bottle of beer on the wall, 1 bottle of beer.
# Take it down and pass it around, no more bottles of beer on the wall.

# No more bottles of beer on the wall, no more bottles of beer.
# Go to the store and buy some more, 99 bottles of beer on the wall.
#     SONG
#     assert_equal expected, BeerSong.lyrics
#   end
# end


# # 10)
# # input: string of digits and amount that should be in each series
# # output: return all possible consecutive number series of a specified length in that string
# # if series length is higher than string length throw an error
# # numbers don't have to be in numerical order

# # Ex: 0123 with a 3-digit series has 012 and 123 for its series

# # Data Structures:
# # string, integer, and arrays for splitting out the digits

# # Algorithm:
# # slices(num) --> if num > series.length raise ArgumentError
# # initialize the series and its length
# # in slices method, create empty array, start point and end point, as well as end point of subarray
# # start point is 0, end point is last index
# # subarray end is specified length-1
# # add a subarray into empty array consisting of [start point..subarr endpoint]
# # increment both of these numbers by one and repeat --- break once subarr endpoint == end point
# # return the original array, now with subarrays in it

# class Series
#   def initialize(series)
#     @series = series.chars.map(&:to_i)
#     @length = series.length
#   end

#   def slices(amount)
#     raise ArgumentError if amount > @length

#     arr = []
#     start = 0
#     subarr_end = amount - 1

#     until subarr_end == @length
#       arr << @series[start..subarr_end]

#       start += 1
#       subarr_end += 1
#     end

#     arr
#   end
# end

# class SeriesTest < Minitest::Test
#   def test_simple_slices_of_one
#     series = Series.new('01234')
#     assert_equal [[0], [1], [2], [3], [4]], series.slices(1)
#   end

#   def test_simple_slices_of_one_again
#     # skip
#     series = Series.new('92834')
#     assert_equal [[9], [2], [8], [3], [4]], series.slices(1)
#   end

#   def test_simple_slices_of_two
#     # skip
#     series = Series.new('01234')
#     assert_equal [[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2)
#   end

#   def test_other_slices_of_two
#     # skip
#     series = Series.new('98273463')
#     expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
#     assert_equal expected, series.slices(2)
#   end

#   def test_simple_slices_of_two_again
#     # skip
#     series = Series.new('37103')
#     assert_equal [[3, 7], [7, 1], [1, 0], [0, 3]], series.slices(2)
#   end

#   def test_simple_slices_of_three
#     # skip
#     series = Series.new('01234')
#     assert_equal [[0, 1, 2], [1, 2, 3], [2, 3, 4]], series.slices(3)
#   end

#   def test_simple_slices_of_three_again
#     # skip
#     series = Series.new('31001')
#     assert_equal [[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3)
#   end

#   def test_other_slices_of_three
#     # skip
#     series = Series.new('982347')
#     expected = [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
#     assert_equal expected, series.slices(3)
#   end

#   def test_simple_slices_of_four
#     # skip
#     series = Series.new('01234')
#     assert_equal [[0, 1, 2, 3], [1, 2, 3, 4]], series.slices(4)
#   end

#   def test_simple_slices_of_four_again
#     # skip
#     series = Series.new('91274')
#     assert_equal [[9, 1, 2, 7], [1, 2, 7, 4]], series.slices(4)
#   end

#   def test_simple_slices_of_five
#     # skip
#     series = Series.new('01234')
#     assert_equal [[0, 1, 2, 3, 4]], series.slices(5)
#   end

#   def test_simple_slices_of_five_again
#     # skip
#     series = Series.new('81228')
#     assert_equal [[8, 1, 2, 2, 8]], series.slices(5)
#   end

#   def test_simple_slice_that_blows_up
#     # skip
#     series = Series.new('01234')
#     assert_raises ArgumentError do
#       series.slices(6)
#     end
#   end

#   def test_more_complicated_slice_that_blows_up
#     # skip
#     slice_string = '01032987583'

#     series = Series.new(slice_string)
#     assert_raises ArgumentError do
#       series.slices(slice_string.length + 1)
#     end
#   end
# end
