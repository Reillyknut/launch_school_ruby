require 'pry'

# 1)
=begin 


Input: array of elements, all of one type (string int, etc)
Output: Rotated array - first element moved to the last element. 
- original array should not be modified




=end 

# def rotate_array(array)
#   first = array.first
#   array.map.each_with_index do |num, idx|
#     if nil
#       first
#     else
#       array[idx+1]
#     end
#   end
# end

# def rotate_array(array)
#   first = array.first
#   arr = array[1..-1] << first
#   arr
# end

# # Test Cases:
# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]  # => true


# Edge cases? empty array? only one element?

=begin 

Data Structure: array of integers



Algorithm:

Given an array, identify the first element and store it in a variable.
Map each item in the given array to the index of itself minus 1
xxxxxxxxxxxxxxxxxxxxxxxxx - had to refactor


=end


# ---------------------------------------------------------------------------- #
# 2)
=begin 


Input: integer as one parameter and another integer as a second parameter
Output: the integers from parameter 1 with the amount of digits from parameter
2 rotated towards the left.
- 2nd param is always positive
- rotating one digit gives the same number


=end 

# def rotate_rightmost_digits(num, rotations)
#   num = num.to_s.chars
#   to_be_rotated = num.slice!(-rotations..-1)
#   rotated = to_be_rotated[1..-1] + [to_be_rotated[0]]
#   (num + rotated).join.to_i
# end

# # Test Cases:
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917


# Edge cases? one number? can second param be invalid?

=begin 

Data Structure: integers represented as an array of strings, manipulated, and
turned back into an integer.



Algorithm:
First, convert integer to string and then to individual chars
create new var containing the numbers that need to be rotated (that are removed
from original string chars array)
Rotate values to the left and add it back onto the first array
join all chars together
convert back to int and return it

=end


# ---------------------------------------------------------------------------- #
# 3)
=begin 


Input: integer
Output: maximum ratation for the given integer -- rotate it, then rotate all
integers but the first, then rotate all int but the 2nd and so on.

=end 

# def max_rotation(integer)
#   length = integer.to_s.length
#   until length == 0
#     integer = rotate_rightmost_digits(integer, length)
#     length -= 1
#   end
#   integer
# end


# Test Cases:
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845


# Edge cases? negative numbers? 0?

=begin 

Data Structure: int as array of strings and converted



Algorithm:
Find max length of given integer and store value in a variable
Using rotate method from before, pass the integer and the max length as params
decrement max length var by 1 until it == 0.
Rotate will be inside of a loop with this conditional.

=end


# ---------------------------------------------------------------------------- #
# 4)
=begin 


Input: integer, n, that is the total number of switches that will exist
Output: array that identifies which lights are on after n repetitions


=end 

# def lights(n)
#   light_hash = {}
#   (1..n).each {|num| light_hash[num] = "off"}
#   counter = 1
#   until counter > n
#     light_hash.each do |k, v|
#       if k % counter == 0
#         if v == "off"
#           light_hash[k] = "on"
#         elsif v == "on"
#           light_hash[k] = "off"
#         end
#       end
#     end
#     counter += 1
#   end
#   light_hash.keys.select { |key, _| light_hash[key] == "on" }
# end

# Test Cases:
# p lights(5) == [1, 4]
# p lights(10) == [1, 4, 9]

# Edge cases? negative numbers? What about 0?

=begin 

Data Structure/Algorithm:

Need a way to represent each number being on/off - hash
create hash of numbers in range 1..n -- set their value to "off"

Until we have gone through n repetitions,
  select all elements with index where the index % n == 0.
  Toggle the selected elements
    - if it was "off", now it is "on" and vice versa
put the values that are "on" into an array and return it



=end


# ---------------------------------------------------------------------------- #
# 5)
=begin 


Input: integer representing amount of lines the diamond should have. Will always
be an odd integer
Output: 4-pointed diamond in a n by n grid.

print out n items, starting with n-1 spaces with one star in the middle or 
(n-1) / 2 spaces on each side. Increment number of stars by 2 and decrement number
of spaces by 2 each time until n stars is reached. Once n stars are reached, do
the opposite and increment spaces and decrement stars by 2 
until number of stars == 1

=end 

# Test Cases:
# diamond(1)

# *

# diamond(3)

#  *
# ***
#  *

#  diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Edge cases?

=begin 

Data Structure/Algorithm:



=end

# def diamond(num)
#   spaces = (num - 1) / 2
#   stars = 1
#   loop do
#     puts ' ' * spaces + '*' * stars + ' ' * spaces
#     stars += 2
#     spaces -= 1
#     if stars == num
#       loop do
#         puts ' ' * spaces + '*' * stars + ' ' * spaces
#         stars -= 2
#         spaces += 1
#         break if stars < 1
#       end
#       break
#     end
#   end
# end

# diamond(9)
# diamond(19)

# ---------------------------------------------------------------------------- #
# 6)

# def minilang(string)
#   string = string.split
#   stack = []
#   register = 0
#   string.each do |token|
#     case token
#     when 'PUSH'   then stack.push(register)
#     when 'ADD'    then register = register + stack.pop
#     when 'SUB'    then register = register - stack.pop
#     when 'MULT'   then register = register * stack.pop
#     when 'DIV'    then register = register / stack.pop
#     when 'MOD'    then register = register % stack.pop
#     when 'POP'    then register = stack.pop
#     when 'PRINT'  then puts register
#     else register = token.to_i
#     end
#   end
# end

# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')

# ---------------------------------------------------------------------------- #
# 7)
=begin 


Input: string
Output: the same string with all words that are numbers ('four', 'five', 'six',
etc) converted to integers. All other words are left alone.

=end 

# NUMBERS = {'one'=>'1', 'two'=>'2', 'three'=>'3', 'four'=>'4', 'five'=>'5', 
#            'six'=>'6', 'seven'=>'7', 'eight'=>'8', 'nine'=>'9', 'zero'=>'0'
#           }

# def word_to_digit(string)
#   NUMBERS.each do |k, v|
#     string.gsub!(k, v)
#   end
#   string
# end

# Test Cases:
# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# Edge cases? No number words at all? 

=begin 

Data Structure/Algorithm: Use array of individual words and compare to a hash
containing the number words and the integers they represent.

Iterate through each individual word
check if each word/key is included in the hash. If it is, set the word/key equal 
to the value/integer.
Join the word array back together 

=end


# ---------------------------------------------------------------------------- #
# 8)

# Input: integer representing the nth number in fibonacci sequence
# Output: resulting integer of the nth number in the sequence


# def fibonacci(num)
#   if num < 2
#     num
#   else
#     fibonacci(num - 1) + fibonacci(num - 2)
#   end
# end


# Test Cases:
# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765


# ---------------------------------------------------------------------------- #
# 9)

# def fibonacci(n)
#   return 1 if n <= 2
#   counter = 2
#   num1 = 1
#   num2 = 1
#   until counter == n
#     sum = num1 + num2
#     num1 = num2
#     num2 = sum
#     counter += 1
#   end
#   sum
# end


# ---------------------------------------------------------------------------- #
# 10)

# def fibonacci_last(n)
#   return 1 if n <= 2
#   counter = 2
#   num1 = 1
#   num2 = 1
#   until counter == n
#     sum = num1 + num2
#     num1 = num2
#     num2 = sum
#     counter += 1
#   end
#   sum.to_s[-1].to_i
# end

