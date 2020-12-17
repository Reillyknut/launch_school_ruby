# 1)
# attr_reader can read the @balance instance variable. Because of this, balance
# returns the value of @balance. Therefore Ben is correct.


# 2)
# quantity is a local variable so it won't update the @quantity instance variable
# to fix, change quantity to @quantity, OR change attr_reader to attr_accessor
# and change quantity to self.quantity


# 3)
# If you fix with an attr_accessor, anyone can now call that setter method.
# A better way is to have a method do the updating so it is protected.


# # 4)
# class Greeting
#   def greet(string)
#     puts string
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end


# # 5)
# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     filling_string = @filling_type ? @filling_type : "Plain"
#     glazing_string = @glazing ? " with #{@glazing}" : ''
#     filling_string + glazing_string
#   end
# end


# 6)
# result is same, but self isn't needed in second example since it can use the
# getter method directly


# 7)
# rename it status so that you can call Light.status on it rather than
# Light.light_status

