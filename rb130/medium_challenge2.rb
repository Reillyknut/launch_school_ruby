# 2)
# input: named or unnamed robot object - no user input
# output: named or renamed robot that doesn't match any other existing robots - should be random name
# names should be in the format of two capital letters followed by 3 numbers

# Data Structure:
# will need something to keep track of current robot names - array in class variable
# strings for sure
# will need to concatenate two capital letters with 3 random numbers as strings
# range ('A'..'Z').to_a.sample gets you random letter => ('0'..'9').to_a.sample gets number

# Algorithm:
# Create class variable to hold all names of robots
# On instantiation generate a name and add it to the name list
  # generating a name will consist of adding two random capital letters followed by 3 random numbers as strings
  # if name is already in the list, generate another name (loop until not in list)
# resetting will remove the robot from the name list and create a new name
# will also need a reader to read the names

class Robot
  attr_reader :name

  @@robots = []

  def initialize
    @name = generate_name unless name
    add_name_to_list
  end

  def reset
    @@robots.delete(@name)
    @name = generate_name
  end

  private

  def generate_name
    new_name = ''
    2.times {new_name << ('A'..'Z').to_a.sample}
    3.times {new_name << ('0'..'0').to_a.sample}

    new_name
  end

  def add_name_to_list
    while @@robots.include?(@name)
      @name = generate_name
    end
    @@robots << @name
  end
end
