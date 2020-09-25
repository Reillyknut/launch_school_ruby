# ask user for two numbers
# ask user for the type of operation to perform: add, subtract, multiply or divide
# perform the requested operation on the two numbers
# display the result


puts "Welcome to my calculator."

puts "Please type in a number:"
num1 = gets.chomp

puts "Please type in a second number:"
num2 = gets.chomp

puts "What would you like to to with these numbers? (1:add 2:subtract 3:multiply 4:divide)"
operator = gets.chomp

if operator == '1'
  result = num1.to_i + num2.to_i

elsif operator == '2'
  result = num1.to_i - num2.to_i

elsif operator == '3'
  result = num1.to_i * num2.to_i

else operator == '4'
  result = num1.to_f / num2.to_f
end

puts "The result is #{result}"