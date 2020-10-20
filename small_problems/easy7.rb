# 1)
# input: two arrays
# output: new array with all elements of two input arrays, but with alternating elements
# Both input arrays are non-empty and have same number of elements
# 
# Test case: interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# 
# Data Structure: arrays
# 
# Algorithm: create empty array
# counter = 0
# loop through both arrays until counter == array1.length
#   add array1[counter] to empty array
#   add array2[counter] to empty array
#   continue adding to empty array, but incrementing counter by 1

# def interleave(array1, array2)
#   new_arr = []
#   counter = 0
#   until counter == array1.length
#     new_arr << array1[counter] << array2[counter]
#     counter += 1
#   end
#   new_arr
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# With zip:

# def interleave(array1, array2)
#   new_arr = array1.zip(array2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


# 2)
# input: string with any type of character inside
# output: hash with three keys: lowercase, uppercase, and neither - with amount in each category
# the number will be the value associated with each key
# if there are none for any category, return 0 for that key value. ' ' counts as "neither"

# Test cases:
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data Structure:
# string represented as array of characters. Use regex, .chars, count
# will need to represent as hash afterwards

# Algorithm:
# Given a string
# Create new hash = { lowercase: 0, uppercase: 0, neither: 0 }
# Turn string into array of characters with .chars.
# For each character, check if it is lower/uppercase/neither.
#   check using regex
# If it is lower/upper/neither, add one to the corresponding value of the new hash
# Return the updated hash

# def letter_case_count(string)
#   hash = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.chars.each do |char|
#     case char
#     when /[a-z]/ then hash[:lowercase] += 1
#     when /[A-Z]/ then hash[:uppercase] += 1
#     else hash[:neither] += 1
#     end
#   end
#   hash
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


# 3)
# def word_cap(string)
#   string.split.each { |word| word.capitalize! }.join(' ')
# end

# p word_cap('four score and seven')
# p word_cap('the javaScript language')
# p word_cap('this is a "quoted" word')


# Without using #capitalize. Could also use hash with (A..Z) and replace with (a..z)

# def word_cap(string)
#   arr = string.downcase.split.map do |word|
#     if word.start_with?(/[a-z]/)
#       word[0].upcase! + word[1..-1]
#     else
#       word
#     end
#   end
#   arr.join(' ')
# end

# p word_cap('four score and seven')
# p word_cap('the javaScript language')
# p word_cap('this is a "quoted" word')


# 4)
# def swapcase(string)
#   new_str = string.split.each do |word|
#     word.chars.map do |char|
#       if char =~ /[a-z]/
#         char.upcase!
#       elsif char =~ /[A-Z]/
#         char.downcase!
#       end
#     end
#   end
#   new_str.join(' ')
# end

# p swapcase('CamelCase')
# p swapcase('Tonight on XYZ-TV')


# 5)
# input: String
# output: New string returning original word with alternating capitalized letters. 
# Numbers are not changed but still count when switching characters
# Pattern: uppercase/lowercase/upper/lower (spaces count but nothing is done to them)
# 
# Test cases:
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# staggered_case(' ') == ' '
#
# Empty string returns empty?
#
# Data Structure: array of letters and converted back to string.
# 
# Algorithm:
# Iterate through each character in the string
#   - string.chars.map
# If the char in the string is not a letter, do nothing with it
# For letters with even indeces (string[0]), map them to uppercase
# For letters with odd indeces (string[1]), map them to downcase
# Join the array and return the new string

# def staggered_case(string, start_with = 'up')
#   new_str = string.chars.each_with_index.map do |char, index|
#     if start_with == 'up'
#       index.even? ? char.upcase : char.downcase

#     elsif start_with == 'down'
#       index.even? ? char.downcase : char.upcase
#     end
#   end
#   new_str.join
# end

# p staggered_case('I Love Launch School!', 'down')
# p staggered_case('ALL_CAPS')
# p staggered_case('ignore 77 the 444 numbers', 'down')
# p staggered_case(' ')


# 6)
# input: string
# output: new string with alternating upper/lowercase, but numbers don't toggle
# the switching of the case of the element. Spaces and special characters DONT count
#
# Test Cases:
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Data Structure: Strings

# Algorithm:
# case_checker = true
# new_str = ''
# For each character in the string, check if it needs to be uppercased
#   - for all numbers, add to new_str - dont change case_checker
# If case_checker is true, uppercase the letter - add letter to new_str
# If false, downcase the letter - add letter to new_str
# Set casechecker to its opposite value for both checks
# return new_str

# def staggered_case(string, numbers_count = false)
#   case_checker = true
#   new_str = ''

#   string.chars.each do |char|
#     if char =~ /[^a-zA-Z]/
#       new_str << char
#       case_checker = !case_checker if numbers_count
#     elsif case_checker == true
#       new_str << char.upcase
#       case_checker = !case_checker
#     else
#       new_str << char.downcase
#       case_checker = !case_checker
#     end 
#   end
#   new_str
# end

# p staggered_case('I Love Launch School!')
# p staggered_case('ALL CAPS')
# p staggered_case('ignore 77 the 444 numbers', false)


# 7)
# def show_multiplicative_average(array)
#   mult = array.each.inject { |total, num| total * num }
#   divide_by = array.length.to_f
#   '%.3f' % (mult / divide_by)
# end

# p show_multiplicative_average([3, 5])
# p show_multiplicative_average([6])
# p show_multiplicative_average([2, 5, 7, 11, 13, 17])


# 8)
# def multiply_list(arr1, arr2)
#   new_arr = []
#   counter = 0

#   until counter == arr1.length
#     new_arr << arr1[counter] * arr2[counter]
#     counter += 1
#   end
#   new_arr
# end

# p multiply_list([3, 5, 7], [9, 10, 11])


# 9)
# def multiply_all_pairs(arr1, arr2)
#   new_arr = []
#   counter = 0

#   until counter == arr1.length
#     arr2.each do |num|
#       new_arr << arr1[counter] * num
#     end
#     counter += 1
#   end
#   new_arr.sort
# end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2])


# 10)
# def penultimate(string)
#   arr = string.split
#   arr[arr.length - 2]
# end

# p penultimate('last word')
# p penultimate('Launch School is great!')

# Further Exploration
# edge cases:
# empty string, only one word, odd vs even num of words?

# def middle_word(string)
#   arr = string.split

#   if arr.length == 0 || arr.length == 1
#     return string
#   elsif arr.length.even?
#     mid_index = (arr.length / 2) - 1
#   else
#     mid_index = arr.length / 2
#   end

#   arr[mid_index]
# end
