# 1)
# expected output:
# 1
# 2
# 2
# 3
# nil
# 
# 2)
# ? : is a ternary operator while ! can mean that a method is destructive
# (potentially), or is the equivalent of "not" when used as actual syntax
#   1. != means "not equals". Use when comparing
#   2. turns user_name into the opposite of its boolean equivalent
#   3. ! makes words.uniq destructive and mutate the caller
#   4. ? will do nothing unless it's being used as a ternary operator
#   5. ? after something is just a naming convention showing it returns a boolean
#   6. !! turns user_name into its boolean equivalent
# 
# 3)
# advice.sub!('important, 'urgent)
# (gsub! works as well)
# 
# 4)
# numbers.delete_at(1) will delete at position 1 (2nd element in array)
# numbers.delete(1) will delete the number 1 from the array
# 
# 5)
# 42.between?(10, 100)
# or
# (10..100).include?(42)
# or
# (10..100).cover?(42)
# 
# 6)
# "Four score and " + famous_words
# or
# "Four score and ".concat(famous_words)
# or
# "Four score and " << famous_words
# 
# 7)
# flintstones.flatten!
# 
# 8)
# flintstones.assoc("Barney")
