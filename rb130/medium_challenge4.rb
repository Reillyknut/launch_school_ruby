# 4)
# input: month number (1-12), year (2021), and the descriptor of the meeting as a string ('first', 'second', 'third', 
# 'fourth', 'fifth', 'last', and 'teenth') alongside the day it should be on.
# output: exact date of a meeting in the specified month and year
# - 2nd Wed of May 2021 => gives you the 12th of May 2021

# Ex/edge cases
# - case insensitive
# - fifth day may not happen every month
# - allow negative years and months > 12?
# - nil if the day doesn't exist

# Data Structures: 
# string and integer - array for the options constant
# make use of the Date class

# Algorithm: 
# meetup.day() should return a date object
# create empty date array
# make weekday and schedule option lowercase
# Go through the days of the given month in the given year and find all of those days (all mondays or all tuesdays etc)
  # starting from day 1, iterate through the days until at the next month
  # if the date.wday == the day number we want (0=sunday up to 6=saturday) put the date into the array
# put all those days into an array
# first = index of 0, second index of 1 and so on - last just returns the array.last
  # teenth is the index of the given weekday name if the day is between 13 and 19
  # return nil if out of range of the array indeces - can maybe use Date#valid_date? method
# create Date object with year, month, and day info and return it

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, option)
    days_array = []
    first_day = Date.civil(@year, @month)
    next_month = first_day.next_month.month

    until first_day.month == next_month
      days_array << first_day if check_day(weekday.downcase, first_day)
      first_day += 1
    end

    select_day(option.downcase, days_array)
  end

  private

  def select_day(option, array) # rubocop:disable Metrics/CyclomaticComplexity
    case option
    when 'first'  then array[0]
    when 'second' then array[1]
    when 'third'  then array[2]
    when 'fourth' then array[3]
    when 'fifth'  then array[4]
    when 'last'   then array[-1]
    when 'teenth' then array.select { |date| date.day.between?(13, 19) }.first
    end
  end

  def check_day(weekday, date) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday
    when 'sunday'     then date.sunday?
    when 'monday'     then date.monday?
    when 'tuesday'    then date.tuesday?
    when 'wednesday'  then date.wednesday?
    when 'thursday'   then date.thursday?
    when 'friday'     then date.friday?
    when 'saturday'   then date.saturday?
    end
  end
end
