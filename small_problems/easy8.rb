# 1)
# input: array of numbers
# output: returns sum of the sums of each leading subsequence for that Array
# ex: sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) => 21

# Test Cases:
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

# edge cases - negative numbers?
# will input always be integer? Return float if float included or convert to int?
# can assume no nested arrays or hashes? 

# Data Structure: Integers primarily. Will need to iterate through given array
# think about using .inject method

# Algorithm:
# Return first number and store it in new variable
# Loop/iterate through all numbers in the given array
# Add sum of 1st and 2nd number (if it exists) and store it in another variable
# then add it to variable above.
# Continue to add subsequent numbers to the stored variable until the last 
# number is reached

# def sum_of_sums(array)
#   counter = 1
#   total_sum  = array[0]
#   running_sum = array[0]
#   until counter == array.length
#     running_sum += array[counter]
#     total_sum += running_sum
#     counter += 1
#   end
#   total_sum
# end


# 2)
# puts "Enter a noun:"
# noun = gets.chomp
# puts "Enter a verb:"
# verb = gets.chomp
# puts "Enter an adjective:"
# adjective = gets.chomp
# puts "Enter an adverb:"
# adverb = gets.chomp

# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?"


# 3)
# input: string
# output: array of substrings in order from shortest to longest
# Take a string and return an array with the first value being the first letter,
# the second value being the first AND second letter, third being the first,
# second, and third, and so on..
# 
# Test Cases:
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# edge cases - empty string? What to do with sentences? Split the words?
# Should spaces be included? Case sensitive? Validate input?

# Data Structure: represent input strings as array of characters to put into
# new array of strings

# Algorithm:
# Split string into individual letters - string.chars
# Find all substrings
# - first is index[0]
# - next is index[0] + index[1]
# - loop until last letter is reached
# Add each substring to new array - create array at start
# - insert letter at index[0] into a new array
# - insert new_array[0] + letter at index[1] into the new array
# Return the new array

# def leading_substrings(string)
#   str_arr = string.chars
#   new_arr = []
#   counter = 0
#   substring = ''
#   until counter == str_arr.length
#     substring += str_arr[counter]
#     new_arr << substring
#     counter += 1
#   end
#   new_arr
# end


# # 4)
# def substrings(string)
#   arr = []
#   counter = 0
#   until counter == string.length
#     arr << leading_substrings(string[counter..-1])
#     counter += 1
#   end
#   arr.flatten
# end

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]


# # 5)
# def palindromes(string)
#   palindrome_list = []
#   substrings(string).each do |substring|
#     palindrome_list << substring if substring == substring.reverse &&
#                                     substring.length >= 2
#   end
#   palindrome_list
# end

# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]


# 6)
# input: two numbers representing a range
# output: all numbers, with numbers divisible by 3 printing "Fizz" instead and
# numbers divisible by 5 printing "Buzz" instead. If divisible by both, print
# "FizzBuzz"
# Should it print out results horizontally? Is vertical on the terminal okay?
 
# Test Cases:
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 
# 13, 14, FizzBuzz
 
# edge cases - should negative numbers be accepted? What if first num is bigger
# than the second? Validate input?

# Data Structure: could use an array of the range. Just int/str themselves?

# Algorithm:
# Given two numbers, create an array of the range of the two numbers
# iterate through the numbers, replacing numbers with the required words:
# - if number % 3 and 5 == 0, replace it with "FizzBuzz"
# - if number % 3 == 0, replace it with "Fizz"
# - if number % 5 == 0, replace it with "Buzz"
# print the values of this new array

# def fizzbuzz(num1, num2)
#   array = []
#   (num1..num2).each { |num| array << num }
#   array.each_with_index do |number, index|
#     if number % 3 == 0 && number % 5 == 0
#       array[index] = "FizzBuzz"
#     elsif number % 3 == 0
#       array[index] = "Fizz"
#     elsif number % 5 == 0
#       array[index] = "Buzz"
#     end 
#   end
#   puts array.join(', ')
# end


# 7)
# input: string
# output: new string where every character is doubled, including symbols and
# spaces. Output is case sensitive.

# Test Cases:
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

# edge cases - ??? Validate inputs? Empty string should return empty string

# Data Structure: array of individual characters

# Algorithm:
# Given a string, split it into individual characters in a new array
# Double each individual character
# - for each individual character, add character into new array twice
# Transform array back into usable string
# output string

# def repeater(string)
#   arr = string.chars
#   new_arr = []
#   arr.each do |char|
#     new_arr << char
#     new_arr << char
#   end
#   new_arr.join
# end


# 8)
# Do the same as last question but add regex conditional on second character
# for consonants

# def double_consonants(string)
#   arr = string.chars
#   new_arr = []
#   arr.each do |char|
#     new_arr << char
#     new_arr << char if char =~ /[a-zA-Z&&[^aeiouAEIOU]]/
#   end
#   new_arr.join
# end


# 9)
# def reversed_number(num)
#   num.to_s.reverse.to_i
# end


# 10)
# def center_of(string)
#   midpoint = string.length / 2
#   if string.length.even?
#     string[midpoint - 1] + string[midpoint]
#   else
#     string[midpoint]
#   end
# end

