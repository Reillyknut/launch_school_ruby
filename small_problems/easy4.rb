# 1)
# def short_long_short(word1, word2)
#   if word1.length >= word2.length
#     word2 + word1 + word2
#   else
#     word1 + word2 + word1
#   end
# end

# puts short_long_short('abc', 'defgh')
# puts short_long_short('abcde', 'fgh')
# puts short_long_short('', 'xyz')


# 2)
# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end


# 3)
# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       if year % 400 == 0
#         return true
#       end
#       return false
#     end
#     return true
#   else
#     false
#   end
# end

# OR

# def leap_year?(year)
#   return true if year % 4 == 0 unless year % 100 == 0
#   return true if year % 100 == 0 && year % 400 == 0
#   false
# end

# # OR

# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end

# puts leap_year?(2016)
# puts leap_year?(2015)
# puts leap_year?(2100)
# puts leap_year?(2400)
# puts leap_year?(240000)
# puts leap_year?(240001)
# puts leap_year?(2000)
# puts leap_year?(1900)
# puts leap_year?(1752)
# puts leap_year?(1700)
# puts leap_year?(1)
# puts leap_year?(100)
# puts leap_year?(400)


# 4)
# def leap_year?(year)
#   if year < 1752
#     year % 4 == 0
#   else
#     (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
#   end
# end

# puts leap_year?(2016)
# puts leap_year?(2015)
# puts leap_year?(2100)
# puts leap_year?(2400)
# puts leap_year?(240000)
# puts leap_year?(240001)
# puts leap_year?(2000)
# puts leap_year?(1900)
# puts leap_year?(1752)
# puts leap_year?(1700)
# puts leap_year?(1)
# puts leap_year?(100)
# puts leap_year?(400)


# 5)
# def multisum(number)
#   adder = 0
#   (1..number).each do |num|
#     adder += num if num % 3 == 0 || num % 5 == 0
#   end
#   adder
# end

# OR

# def multisum(number)
#   new_range = (1..number).select { |multiple| multiple % 3 == 0 || multiple % 5 == 0 }
#   new_range.inject { |sum, num| sum + num }
# end

# puts multisum(3)
# puts multisum(5)
# puts multisum(10)
# puts multisum(1000)


# 6)

# def running_total(array)
#   counter = 0
#   total = array[counter]
#   loop do
#     break if array.length == 0
#     array[counter] = total
#     counter += 1
#     break if counter == array.length
#     total = total + array[counter]
#   end
#   array
# end

# OR

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# p running_total([2, 5, 13])
# p running_total([14, 11, 7, 15, 20])
# p running_total([3])
# p running_total([])


# 7)
# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(str_num)
#   array = str_num.chars.map { |num| DIGITS[num] }
#   array.inject { |sum, number| sum*10 + number }
# end

# p string_to_integer('4321')
# p string_to_integer('570')


# 8)
# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(str_num)
#   array = str_num.chars.map { |num| DIGITS[num] }
#   array.inject { |sum, number| sum*10 + number }
# end

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

# puts string_to_signed_integer('4321')
# puts string_to_signed_integer('-570')
# puts string_to_signed_integer('+100')


# 9)
# DIGITS = {
#   0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
#   5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
# }

# def integer_to_string(int_num)
#   array = int_num.digits.reverse.map { |num| DIGITS[num] }
#   array.join
# end

# puts integer_to_string(4321)
# puts integer_to_string(0)
# puts integer_to_string(5000)


# 10)
# DIGITS = {
#   0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
#   5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
# }

# def integer_to_string(int_num)
#   array = int_num.digits.reverse.map { |num| DIGITS[num] }
#   array.join
# end

# def signed_integer_to_string(number)
#   if number.negative?
#     integer_to_string(number*-1).prepend('-')
#   elsif number == 0
#     integer_to_string(number)
#   else
#     integer_to_string(number).prepend('+')
#   end
# end

# puts signed_integer_to_string(4321)
# puts signed_integer_to_string(-123)
# puts signed_integer_to_string(0)
