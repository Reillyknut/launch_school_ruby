# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(produce)
#   selected_fruits = {}
#   produce.each do |k, v|
#     selected_fruits[k] = v if produce[k] == 'Fruit'
#   end
#   selected_fruits
# end

# puts select_fruit(produce)

# ------------------------------ #

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     numbers[counter] *= 2
#     counter += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# puts double_numbers!(my_numbers)
# puts my_numbers

# ------------------------------ #

# def double_odd_numbers(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     numbers[counter] *= 2 if counter.odd?
#     counter += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# puts double_odd_numbers(my_numbers)
# puts my_numbers

# ------------------------------ #

# def multiply_array(numbers, multiplier)
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     numbers[counter] *= multiplier
#     counter += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# puts multiply_array(my_numbers, 6)
# puts my_numbers