# 1)
# array = []
# puts "Enter the 1st number:"
# array << gets.chomp.to_i

# puts "Enter the 2nd number:"
# array << gets.chomp.to_i

# puts "Enter the 3rd number:"
# array << gets.chomp.to_i

# puts "Enter the 4th number:"
# array << gets.chomp.to_i

# puts "Enter the 5th number:"
# array << gets.chomp.to_i

# puts "Enter the last number:"
# answer = gets.chomp.to_i

# if array.include?(answer)
#   puts "The number #{answer} appears in #{array}"
# else
#   puts "The number #{answer} does not appear in #{array}"
# end


# 2)
# puts "Enter the first number:"
# first_num = gets.chomp.to_i

# puts 'Enter the scond number:'
# second_num = gets.chomp.to_i

# sum = first_num + second_num
# difference = first_num - second_num
# product = first_num * second_num
# quotient = first_num / second_num
# remainder = first_num % second_num
# exponent = first_num ** second_num

# puts "#{first_num} + #{second_num} = #{sum}"
# puts "#{first_num} - #{second_num} = #{difference}"
# puts "#{first_num} * #{second_num} = #{product}"
# puts "#{first_num} / #{second_num} = #{quotient}"
# puts "#{first_num} % #{second_num} = #{remainder}"
# puts "#{first_num} ** #{second_num} = #{exponent}"


# 3)
# puts "Please write a word or multiple words:"
# answer = gets.chomp

# characters = answer.split.join.chars.count

# puts "There are #{characters} characters in '#{answer}'"


# 4)
# def multiply(num1, num2)
#   num1 * num2
# end

# puts multiply(4, 6)
# puts multiply([1, 2, 3], 5)

# 5)
# def multiply(num1, num2)
#   num1 * num2
# end

# def square(number)
#   multiply(number, number)
# end

# puts square(5)
# puts square(-8)


# 6)
# def xor?(arg1, arg2)
#   return true if arg1 && !arg2 || !arg1 && arg2
#   false
# end

# puts xor?(5.even?, 4.even?)
# puts xor?(5.odd?, 4.odd?)
# puts xor?(5.odd?, 4.even?)
# puts xor?(5.even?, 4.odd?)


# 7)
# def oddities(array)
#   new_array = []
#   array.each_with_index do |num, index|
#     if index.even?
#       new_array << num
#     end
#   end
#   new_array
# end

# p oddities([2, 3, 4, 5, 6])
# p oddities([1, 2, 3, 4, 5, 6])
# p oddities(['abc', 'def'])
# p oddities([123])
# p oddities([])


# 8)
# def palindrome?(word)
#   word.reverse == word
# end

# puts palindrome?('madam')
# puts palindrome?('Madam')
# puts palindrome?("madam i'm adam")
# puts palindrome?('356653')


# 9)
# def real_palindrome?(word)
#   word.reverse.downcase.gsub(/[^a-z]/, '') == word.downcase.gsub(/[^a-z]/, '')
# end

# puts real_palindrome?('madam')
# puts real_palindrome?('Madam')
# puts real_palindrome?("Madam, I'm Adam")
# puts real_palindrome?('356653')
# puts real_palindrome?('356a653')
# puts real_palindrome?('123ab321')

# 10)
# def palindromic_number?(number)
#   number.to_s.reverse == number.to_s
# end

# puts palindromic_number?(34543)
# puts palindromic_number?(123210)
# puts palindromic_number?(22)
# puts palindromic_number?(5)
