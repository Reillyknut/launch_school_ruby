# 1)
# def greetings(array, hash)
#   puts "Hello, #{array.join(' ')}! "\
#   "Nice to have a #{hash[:title]} #{hash[:occupation]} around."
# end


# 2)
# input: number
# output: number multiplied by 2 unless the number is a double number
# double numbers have even number of digits and when split down the middle, the
# first half is exactly equal to the second half.

# Test Cases:
# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10

# edge cases - floats accepted? Negative numbers count? double 00?

# Data Structure: integers. May have to convert to string and back to int

# Algorithm:
# Check whether or not number is a double number
# - even number of digits?
# - first half of number is == to second half of number
#     - find halfway point of number
#     - check if numbers up to halfway point are == numbers from half to the end
# If it is a double number, return number
# If not, return number * 2

# def double_num?(num)
#   return false if num.to_s.length.odd?
#   midpoint = num.to_s.length / 2
#   first_half = num.to_s[0..midpoint-1].to_i
#   second_half = num.to_s[midpoint..-1].to_i
#   first_half == second_half
# end

# def twice(num)
#   if double_num?(num)
#     return num
#   end
#   num * 2
# end


# 3)
# def negative(number)
#   if number <= 0
#     return number
#   end
#   -number
# end


# 4)
# def sequence(num)
#   if num < 0
#     -1.downto(num).to_a
#   else
#     (1..num).to_a
#   end
# end


# 5)
# def uppercase?(string)
#   word = string.gsub(/[^a-zA-Z]/, '')
#   return false if word.empty? # returns false if string contains no letters
#   word == word.downcase.upcase
# end


# 6)
# def word_lengths(string)
#   arr = string.split(' ')
#   arr.map do |word|
#     word + " #{word.length}"
#   end
# end


# 7)
# def swap_name(name)
#   name.split.reverse.join(', ')
# end


# 8)
# def sequence(count, num)
#   arr = []
#   counter = 0
#   running_sum = num
#   until counter == count
#     arr << running_sum
#     running_sum += num
#     counter += 1
#   end
#   arr
# end


# 9)
# def get_grade(grade1, grade2, grade3)
#   average = (grade1 + grade2 + grade3) / 3
#   case
#   when average < 60 then 'F'
#   when average < 70 then 'D'
#   when average < 80 then 'C'
#   when average < 90 then 'B'
#   else                   'A'
#   end
# end


# 10)
# def buy_fruit(array)
#   arr = []
#   array.each do |sub_array|
#     sub_array[1].times do
#       arr << sub_array[0]
#     end
#   end
#   arr
# end
