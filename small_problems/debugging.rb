# 1)
# counter = 10

# counter.times do
#   puts counter
#   counter -= 1
# end

# puts 'LAUNCH!'

# the decrease() method isn't affecting the actual counter variable. the scope
# is contained within the method. Counter is also the argument taken by the 
# decrease method and isn't the same variable that is initialized later.


# 2)

# Because the destructive method is being called before .each, which
# is not destructive and returns ['y', 'o', 'u'. Changes below should be made.

# def shout_out_to(name)
#   name.upcase!

#   puts 'HEY ' + name
# end

# shout_out_to('you')


# 3)
# def valid_series?(nums)
#   return false if nums.sum != 47

#   odd_count = nums.count { |n| n.odd? }
#   odd_count == 3 ? true : false
# end

# odd_count was setting a variable = 3 which will always evaluate to true,
# rather than checking to see if it was true with ==


# 4)
# def reverse_sentence(sentence)
#   words = sentence.split(' ')
#   reversed_words = []

#   i = 0
#   while i < words.length
#     reversed_words.prepend(words[i])
#     i += 1
#   end

#   reversed_words.join(' ')
# end

# Can't add an array and a string together. Need to use unshift, <<, prepend, etc.


# 5)




# 6)




# 7)




# 8)




# 9)




# 10)



