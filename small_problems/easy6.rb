# 1)
# input: float number between 0-360
# output: string with degree symbol, min, and sec symbols - mins and secs 
# should be two digit numbers with leading zeroes
# 
# 
# degrees will equal the whole number rounded down
# minutes will equal the number after decimal point times 60
# seconds will equal the number after decimal point of minutes times 60
# return string concatenated with the three values - round however you like
#

# DEGREE = "\xC2\xB0"

# def dms(number)
#   number %= 360
#   degrees = number.to_i
#   if number == degrees
#     minutes = 0
#     seconds = 0
#   else
#     minutes_decimal = (number % degrees) * 60
#     minutes = minutes_decimal.to_i
#     seconds = (minutes_decimal % minutes) * 60
#   end

#   "#{degrees}#{DEGREE}#{"%02d" % minutes}'#{"%02d" % seconds}\""
# end

# puts dms(30)
# puts dms(76.73)
# puts dms(254.6)
# puts dms(93.034773)
# puts dms(0)
# puts dms(360)
# puts dms(400)
# puts dms(-40)
# puts dms(-420)


# 2)
# def remove_vowels(array)
#   array.map do |string|
#     string.delete('aeiouAEIOU')
#   end
# end

# OR
# def remove_vowels(array)
#   array.map do |string|
#     string.gsub(/([aeiou])/i, '')
#   end
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
# p remove_vowels(%w(green YELLOW black white))
# p remove_vowels(%w(ABC AEIOU XYZ))


# 3)
# input = number representing the number of digits
# output = index of first number that reaches the number of digits (until input == index[number].digits.count)
# fibonacci = 1, 1, then the sum of previous two numbers
#
# have two store variables a=1, b=1 and a counter=1. Output fib = a+b. If fib.digits.count == num_digits, break.
# set a=b and b=fib and fib = new_a and new_b and add 1 to counter


# def find_fibonacci_index_by_length(num_digits)
#   counter = 1
#   a = 0
#   b = 1
#   loop do
#     fib = a+b
#     a = b
#     b = fib
#     counter += 1
#     return counter if fib.digits.count == num_digits
#   end
# end

# puts find_fibonacci_index_by_length(2)
# puts find_fibonacci_index_by_length(3)
# puts find_fibonacci_index_by_length(10)
# puts find_fibonacci_index_by_length(100)
# puts find_fibonacci_index_by_length(1000)
# puts find_fibonacci_index_by_length(10000)


# 4)
# input: array of elements
# output: the same array from the input mutated with elements reversed
# Cannot use reverse or reverse!
#
# structure is arrays - may want to think about using map here
# do I want to use a seperate array to store?
# 
# algo:
# create new empty array
# assign counter to input array.length - 1
# iterate/loop backwards through input array starting with input array[counter]
# iterate/loop until counter < 0 
#   - take the last value of input array and add it to new_array
#     - counter -= 1
#   - new_array will now equal reversed input array
# map! input array indexes to equivalent index of new_array

# def arr_reverse(array)
#   new_arr = []
#   counter = array.length - 1
#   until counter < 0
#     new_arr << array[counter]
#     counter -= 1
#   end
#   counter = 0
#   array.map! do |element|
#     element = new_arr[counter]
#     counter += 1
#     element
#   end
# end


# 5)
# def reverse(array)
#   new_arr = []
#   counter = array.length - 1
#   until counter < 0
#     new_arr << array[counter]
#     counter -= 1
#   end
#   new_arr
# end

# puts reverse([1,2,3,4]) == [4,3,2,1]
# puts reverse(%w(a b e d c)) == %w(c d e b a)
# puts reverse(['abc']) == ['abc']
# puts reverse([]) == []


# 6)
# def merge(arr1, arr2)
#   arr1 + arr2.uniq
# end


# 7)
=begin 
Problem: write a method
input: array
output: nested array of original array split in half to two arrays

if odd amt of numbers, middle element goes into first array
single numbers return nested array with number and second nested array with []
empty array returns two nested empty arrays: [[], []]

Tests:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

structure: arrays
Think about using group_by, arr.length, include?, odd?, reject maybe
Make new array and add arrays into it?

algo:
create empty array with two empty nested arrays

counter = 0
Find halfway point of array(index), which is also the point to stop adding to new_arr[0]
  if array.length.odd?, halfway point = array.length / 2
  else, halfway point = (array.length / 2) - 1

index of array = 0
Loop through original array until it has reached array.length
  for each number, add it to new_arr[counter] until halfway is reached
  once reached, counter += 1, and add rest of numbers to new_arr[counter]
  index of array += 1 to loop through array numbers
return new_arr

=end

# def halvsies(array)
#   new_arr = [[], []]
#   counter = 0
#   if array.length.odd?
#     halfway = array.length / 2
#   else
#     halfway = (array.length / 2) - 1
#   end

#   index = 0
#   until index == array.length
#     new_arr[counter] << array[index]

#     if index == halfway
#       counter += 1
#     end
#     index += 1
#   end

#   new_arr
# end


# 8)
# works for numbers only
#
# def find_dup(array)
#   array2 = array.uniq
#   array.sum - array2.sum
# end

# OR

# def find_dup(array)
#   counter = 0
#   until counter  == array.length - 1
#     if array[(counter+1)..(array.length - 1)].include?(array[counter])
#       return array[counter]
#     end
#     counter += 1
#   end
# end


# 9)
# def include?(array, value)
#   array.each do |element|
#     return true if element == value
#   end
#   false
# end


# 10)
# input: positive integer, n
# output: right triangle. Each side has n stars (vertical, horizontal, diagonal)
#  - hypotenuse should always be on left side sloping upwards and to the right.
#  - n+1 will be the number of lines the code should print out
#  - each line should be prepended with ' ' until n stars are printed out
#  - ex: pattern for 5 stars - 5 spaces and 0 stars
#                            - 4 spaces and 1 star
#                            - 3 spaces and 2 stars
#                            - 2 spaces and 3 stars
#                            - 1 space  and 4 stars
#                            - 0 spaces and 5 stars

# Edge cases: 0 should printo a blank line
# Data structure: String as I go along

# Algorithm:
# counter = 0
# num_spaces = n 
# print out n spaces and 0 stars
# increment stars by 1 and subtract 1 from number of spaces until number of stars == n
#     - use counter for number of stars printed
# 

# def triangle(num)
#   num_stars = 0
#   num_spaces = num
#   until num_stars > num
#     puts ' ' * num_spaces + '*' * num_stars
#     num_stars += 1
#     num_spaces -= 1
#   end
# end

