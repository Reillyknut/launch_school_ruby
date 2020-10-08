# 1)
# age = rand(20..200)
# puts "Teddy is #{age} years old!"


# 2)
# SQMETERS_TO_SQFEET = 10.7639

# puts "Enter the length of the room in meters:"
# length = gets.chomp

# puts "Enter the width of the room in meters:"
# width = gets.chomp

# area = length.to_f * width.to_f.round(2)

# puts "The area of the room is #{area} square meters (#{(area*SQMETERS_TO_SQFEET).round(2)} square feet)."


# 3)
# puts "What is the bill?"
# bill = gets.chomp.to_f

# puts "What is the tip percentage?"
# pct = gets.chomp.to_f / 100

# tip = bill * pct
# puts "The tip is $#{tip.round(2)}"

# total = bill + tip
# puts "The total is $#{total.round(2)}"


# 4)
# puts "What is your age?"
# age = gets.chomp.to_i

# puts "When you wanna retire?"
# retire_age = gets.chomp.to_i

# years_until_retire = retire_age - age
# current_year = Time.now.year
# retire_year = current_year + years_until_retire 

# puts "It's #{current_year}. You will retire in #{retire_year}."
# puts "You have only #{years_until_retire} years of work to go!"


# 5)
# puts "What is your name?"
# name = gets.chomp

# if name.include?('!')
#   name = name.tr('!', '').upcase
#   puts "HELLO #{name}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}"
# end


# 6)
# (1..99).each { |num| puts num if num.odd? }


# 7)
# (1..99).each { |num| puts num if num.even? }


# 8)
# puts "Enter an integer greater than 0:"
# number = gets.chomp.to_i
# range = []
# (1..number).each { |num| range.push num}

# # product = 1
# # range.each do |num| 
# #   product *= num
# # end

# product = (1..number).inject(1) {|product, operand| product * operand }

# puts "Enter 's' to compute the sum, 'p' to compute the product."
# operation = gets.chomp
# case operation
#   when 's'
#     puts "The sum of the integers between 1 and #{number} is #{range.sum}"
#   when 'p'
#     puts "The product of the integers between 1 and #{number} is #{product}"
#   else
#     puts "Invalid operation"
# end


# 9)
# BOB
# BOB


# 10)
# array2 = ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
