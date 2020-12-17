# # 1)
# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class


# # 2)
# class Cat; end


# # 3)
# class Cat; end
# kitty = Cat.new


# # 4)
# class Cat
#   def initialize
#     puts "I'm a cat!"
#   end
# end

# kitty = Cat.new


# # 5)
# class Cat
#   def initialize(name)
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')


# # 6)
# class Cat
#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{@name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet


# # 7)
# class Cat
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet


# # 8/9)
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet


# # 10)
# module Walkable
#   def walk
#     puts "Let's go for a walk!"
#   end
# end

# class Cat
#   include Walkable

#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet


# #-----------------------------------------------------------------------------#

# # 11)
# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end

# Cat.generic_greeting


# # 12)
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.name
# kitty.rename('Chloe')
# kitty.name


# # 13)
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify


# # 14)
# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end

#   def personal_greeting
#     puts "Hello! My name is #{self.name}!"
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting


# # 15)
# class Cat
#   @@cat_count = 0

#   def initialize
#     @@cat_count += 1
#   end

#   def self.total
#     puts @@cat_count
#   end
# end

# kitty1 = Cat.new
# kitty2 = Cat.new
# Cat.total


# # 16)
# class Cat
#   COLOR = 'orange'

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet


# # 17)
# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty


# # 18)
# class Person
#   attr_accessor :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret


# # 19)
# class Person
#   attr_writer :secret

#   def share_secret
#     puts secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret


# # 20)
# class Person
#   attr_writer :secret

#   def compare_secret(person)
#     secret == person.secret
#   end

#   protected

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'

# person2 = Person.new
# person2.secret = 'Shh.. this is a different secret!'

# puts person1.compare_secret(person2)
