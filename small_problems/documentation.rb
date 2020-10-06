# 1)
# File::path calls the class method while File#path calls the instance method


# 2)
# -4712-01-01
# 2016-01-01
# 2016-05-01
# 2016-05-13


# 3)
# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end

# my_method(4, 5, 6)
# returns [4, 5, 3, 6]


# 4)
# number = a.bsearch { |x| x >= 8 }
# puts number


# 5)
# a = %w(a b c d e)
# puts a.fetch(7) # => error
# puts a.fetch(7, 'beats me') # => 'beats me'
# puts a.fetch(7) { |index| index**2 } # => 49


# 6)
# 5.step(to: 10, by: 3) { |value| puts value }
# returns 5 and 8


# 7)
# s = 'abc'
# puts s.public_methods(false).inspect


# 8)
# a = [5, 9, 3, 11]
# puts a.min(2)


# 9)
# http://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html#method-c-load_file


