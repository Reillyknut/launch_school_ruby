# 1)
# "You will " + one of the random choices


# 2)
# RoadTrip overrides the choices method in the Oracle class so 
# predict_the_future uses the choices method in RoadTrip.


# 3)
# Orange.ancestors and HotSauce.ancestors


# # 4)
# #Fixed class:
# class BeesWax
#   attr_accessor :type

#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{type} of Bees Wax"
#   end
# end


# # 5)
# excited_dog = "excited dog" # - local variable
# @excited_dog = "excited dog" # - instance variable
# @@excited_dog = "excited dog" # - class variable


# 6)
# self.manufacturer is a class method since it uses self in its definition
# can call Television.manufacturer to call the method.


# 7)
# @@cats_count keeps a running total of how many instances of the Cat class have
# been created. Every time a Cat instance is created @@cats_count is incremented
# by 1 at initialization.
# To test, create several cat instances and then call Cat.cats_count


# # 8)
# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end


# 9)
# adding a play method to the Bingo class will override the play method from the
# Game class.


# 10)
# encapsulation is a benefit, where you can keep code from being changed by
# those you don't want to change it.
# inheritance is a benefit, where classes can inherit certain properties and
# methods from each other.
# OOP allows for code to be better contained into chunks, where it can be used 
# more abstractly by programmers.
# Can easily give functionality to diff parts of an app without duplication.
# Can build applications faster as we can reuse pre-written code.
# As software becomes more complex this complexity can be more easily managed.
