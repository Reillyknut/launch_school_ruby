# 3)
# input: time in the form of an integer representing hours and mins
# output: time that the integers represent and in a 24 hour time format (00:00-24:00) as a string
# Clock.at(10, 30) => 10:30 
# allow for second input to be > 60? allow for 1st input to be > 24?
# adding to Clock adds on minutes => Clock.at(10) - 90 = 08:30
# clock resets after 23:59 back to 00:00

# Data Structures:
# integers and strings
# format 00 with "%02d" % 9 => 09

# Algorithm:
# Given total amount of hours and minutes, get total amount of minutes
# get the remainder when divided by 60 => this is the amount of minutes
  # ( need to do this because of mins > 60 or < 0) 
# Represent time in correct 00:00 format as a string
  # "%02d" % number on each side of :
# will need methods to add and subtract that use the previous method of finding total minutes
# Also need == method to check if time is the same
# 
# negative numbers from subtracting will be treated as 1440 + the negative number - % does this
# total minutes after 1440 --> take remainder of division by 1440

class Clock
  attr_reader :hours, :mins

  def at(hour, min)
    @total_mins = ((hour * 60) + min) % 1440
    @hours = @total_mins / 60
    @mins = @total_mins % 60
    self
  end

  def self.at(hour, min = 0)
    Clock.new.at(hour, min)
  end

  def ==(other)
    hours == other.hours && mins == other.mins
  end

  def +(other)
    at(@hours, @mins + other)
  end

  def -(other)
    at(@hours, @mins - other)
  end

  def to_s
    '%02d' % @hours + ':' + '%02d' % @mins
  end
end
