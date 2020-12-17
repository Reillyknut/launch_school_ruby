# # 1)
# hello = Hello.new
# hello.hi # => "Hello"

# hello = Hello.new
# hello.bye # => undefined method

# hello = Hello.new
# hello.greet # => Error expected 1 argument

# hello = Hello.new
# hello.greet("Goodbye") # => "Goodbye"

# Hello.hi # => undefined method


# 2)
# To fix, change the hi method definition to self.hi and greet to self.greet.
# OR create instance of Greeting within self.hi method and call greet on that.


# 3)
# cat1 = AngryCat.new(5, 'Fuzzy')
# cat2 = AngryCat.new(2, 'Pebbles')

# # 4)
# class Cat
#   attr_reader :type

#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     "I am a #{type} cat."
#   end
# end


# # 5)
# tv = Television.new # => creates new instance of Television class called tv
# tv.manufacturer # => Error since self.manufacturer is a class method
# tv.model # => gives the model of the tv instance

# Television.manufacturer # => gives the manufacturer of the Television class
# Television.model # => Error since model is an instance method


# # 6)
# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end


# 7)
# redundant return is used.

