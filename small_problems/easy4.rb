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



# 7)



# 8)



# 9)



# 10)


