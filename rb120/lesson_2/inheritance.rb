# # 1)
# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak
# puts teddy.swim 

# karl = Bulldog.new
# puts karl.speak
# puts karl.swim


# # 2)
# class Pet
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end
# end

# class Dog < Pet
#   def swim
#     'swimming!'
#   end

#   def fetch
#     'fetching!'
#   end

#   def speak
#     'bark!'
#   end
# end

# class Cat < Pet
#   def speak
#     'meow!'
#   end
# end

# pete = Pet.new
# kitty = Cat.new
# dave = Dog.new
# bud = Bulldog.new

# pete.run
# pete.speak

# kitty.run
# kitty.speak
# kitty.fetch

# dave.speak

# bud.run
# bud.swim


# 3) - diagram


# 4)
# => [Bulldog, Dog, Pet, Object, Kernel, BasicObject]
