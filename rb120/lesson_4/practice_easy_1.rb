# 1)
# They are all objects. Call the #class method on each of them to 
# determine what they are.

# # 2)
# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed

#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed

#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Car.new.go_fast
# Truck.new.go_fast


# 3)
# self.class will insert the class of the object into the string.
# -  it is inside of a string and is interpolated so don't need to_s method.


# 4)
# mad_cat = AngryCat.new


# 5)
# @ denotes an instance variable, so the Pizza class has one.
# - alternatively, use the #instance_variable method

# 6)
# add an attr_accessor or attr_reader


# 7)
# to_s method returns name of object's class and encoding of object id


# 8)
# self references the instance of the class that called the method.
# If an instance of the Cat class calls this method, that instance
# is the calling object ---> similar to calling cat1.age where cat1 is
# the instance of Cat.


# 9)
# self references the class itself here. self.cats_count is a class method
# and can be called on the class itself.


# 10)
# Bag.new('red', 'leather')

