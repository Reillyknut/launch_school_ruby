# 1)
# def repeater(word, number)
#   number.times { puts word }
# end


# 2)
# def is_odd?(number)
#   number % 2 != 0
# end


# 3)
# def digit_list(number)
#   number.to_s.chars.map(&:to_i)
# end

# 4)
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# def count_occurrences(vehicles)
#   vehicle_list = vehicles.uniq
#   vehicle_list.each do |vehicle|
#     p vehicles.count(vehicle)
#   end
# end


# 5)
# def reverse_sentence(string)
#   string = string.split.reverse.join(' ')
# end
  

# 6)
# def reverse_words(string)
#   string = string.split
#   string.map! do |word|
#     if word.length >= 5
#       word.reverse
#     else
#       word
#     end
#   end
#   string.join(' ')
# end


# 7)
# def stringy(number, start_with = 1)
#   counter = 0
#   string = ''
#   until counter == number
#     if counter.even?
#       string << start_with.to_s
#       counter += 1
#     else
#       if start_with == 1
#         string << '0'
#         counter += 1
#       else
#         string << '1'
#         counter += 1
#       end
#     end
#   end
#   string
# end


# 8)
# def average(array)
#   array.sum.to_f / array.length
# end


# 9)
# def sum(number)
#   number.digits.sum
# end


# 10)
# def calculate_bonus(salary, bonus)
#   bonus ? (salary / 2) : 0
# end

