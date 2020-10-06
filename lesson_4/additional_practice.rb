# 1)
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# new_hash = {}

# for name in flintstones do
#   new_hash[name] = flintstones.index(name)
# end

# puts new_hash


# 2)
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
#          "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# total = 0
# ages.each do |k, v|
#   total += v
# end

# puts total


# 3)
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.delete_if { |_, age| age >= 100}

# puts ages


# 4)
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, 
#          "Marilyn" => 22, "Spot" => 237 }

# puts ages.values.min


# 5)
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.each do |name|
#   if name.include?('Be')
#     puts flintstones.index(name)
#     break
#   end
# end

# OR

# flintstones.index { |name| name[0, 2] == "Be" }


# 6)
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# counter = 0

# loop do
#   flintstones[counter].delete_suffix!(flintstones[counter][3..])
#   counter += 1
#   break if counter == flintstones.length
# end

# puts flintstones

# OR

# flintstones.map! { |name| name[0,3] }


# 7)
# statement = "The Flintstones Rock"
# statement = statement.delete!(' ').chars
# hash = {}

# statement.each do |letter|
#   x = statement.count(letter)
#   hash[letter] = x
# end

# puts hash


# 8)
# 1 and 3 are shifted off since 3 becomes the 2nd value after 1 is shifted off
# 1st value of [1, 2, 3, 4] is one. 2nd value of [2, 3, 4] is 3.


# 9)
# def titalize(string)
#   string = string.split(' ')
#   string.map! { |word| word.capitalize }
#   string = string.join(' ')
#   puts string
# end

# words = "the flintstones rock"
# titalize(words)

# OR

# words.split.map { |word| word.capitalize }.join(' ')


# 10)
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |k, v|
#   if (0..18).include?(munsters[k]["age"])
#     munsters[k]["age_group"] = "kid"
#   elsif (18..65).include?(munsters[k]["age"])
#     munsters[k]["age_group"] = "adult"
#   else
#    munsters[k]["age_group"] = "senior"
#   end
# end

# # OR

# munsters.each do |name, details|
#   case details["age"]
#   when 0...18
#     details["age_group"] = "kid"
#   when 18...65
#     details["age_group"] = "adult"
#   else
#     details["age_group"] = "senior"
#   end
# end