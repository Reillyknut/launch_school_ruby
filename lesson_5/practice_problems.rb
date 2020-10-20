# 1)
# arr = ['10', '11', '9', '7', '8']

# arr.sort! { |a, b| b.to_i <=> a.to_i }

# p arr


# 2)
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# p books.sort_by { |hash| hash[:published].to_i } # Don't need .to_i, but would need it if years of
#                                                  # different lengths were being considered.


# 3)
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# arr1[2][1][3]
# arr2[1][:third][0]
# arr3[2][:third][0][0]
# hsh1['b'][1]
# hsh2[:third].key(0)

# 4)
# arr1 = [1, [2, 3], 4]

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# hsh1 = {first: [1, 2, [3]]}

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# arr1[1][1] = 4
# arr2[2] = 4
# hsh1[:first][2][0] = 4
# hsh2[['a'][:a][2] = 4


# 5)
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# total = 0
# males = munsters.select do |_, val|
#   val["gender"] == "male"
# end

# males.each do |_, v|
#   total += v["age"]
# end

# puts total


# 6)
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, hash|
#   puts "#{name} is a #{hash["age"]}-year-old #{hash["gender"]}"
# end


# 7)
# arr = [2, [5, 8]]
# arr[0] += 2 => arr = [4, [5, 8]]
# arr[1][0] -= a => arr = [4, [3, 8]]

# a = 2
# b = [3, 8]


# 8)
# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# vowels = []

# hsh.each do |key, value|
#   value.each do |word|
#     word.chars.select do |letter| 
#       vowels << letter if letter =~ /[aeiou]/ 
#     end
#   end
# end

# puts vowels


# 9)
# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# arr.map! do |array|
#   array.sort do |a, b|
#     b <=> a
#   end
# end

# p arr


# 10)
# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr.map! do |hash|
#   hash.each { |key, value| hash[key] = value + 1 }
# end

# p arr


# 11)
# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# arr.map do |subarray|
#   subarray.select { |num| num % 3 == 0 }
# end


# 12)
# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# hash = {}

# arr.each do |item|
#   hash[item[0]] = item[1]
# end


# 13)
# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# arr.sort_by do |subarray|
#   subarray.reject { |num| num.even? }
# end


# 14)
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# #for each hash item, if the item has type: 'fruit', return colors: value and put it in new array
# #if the item has type: 'vegetable',  return size: value and put it in new array

# arr = []
# hsh.each do |_, attributes|
#   if attributes[:type] == 'fruit'
#     arr << attributes[:colors].map { |word| word.capitalize }
#   else
#     arr << attributes[:size].upcase
#   end
# end


# 15)
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# arr.select do |hash|
#   hash.values.flatten.all? { |num| num.even? }
# end


# 16)
# def random_character()
#   characters = ('a'..'z').to_a + ('0'..'9').to_a
#   characters.sample
# end

# def uuid()
#   str = ''
#   8.times { str << random_character }
#   str << '-'
#   4.times { str << random_character }
#   str << '-'
#   4.times { str << random_character }
#   str << '-'
#   4.times { str << random_character }
#   str << '-'
#   12.times { str << random_character }
#   str
# end

OR

# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end
