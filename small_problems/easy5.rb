# 1)
# def ascii_value(string)
#   sum = 0
#   string.chars.each { |letter| sum += letter.ord }
#   sum
# end

# puts ascii_value('Four score')
# puts ascii_value('Launch School')
# puts ascii_value('a')
# puts ascii_value('')


# 2)
# MINUTES_PER_DAY = 1440

# def time_of_day(total_mins)
#   if total_mins > MINUTES_PER_DAY
#     total_mins = total_mins % MINUTES_PER_DAY
#   end

#   if total_mins < -MINUTES_PER_DAY
#     total_mins = total_mins % -MINUTES_PER_DAY
#   end

#   if total_mins >= 0
#     hours = total_mins / 60
#     mins = total_mins % 60
#     "#{"%02d" % hours}:#{"%02d" % mins}"
#   else
#     hours = 24 - (-total_mins / 60)
#     mins = 60 - (-total_mins % 60)
#     hours = hours - 1 if mins > 0
#     "#{"%02d" % hours}:#{"%02d" % mins}"
#   end
# end

# With Date/Time classes:

# def time_of_day(total_mins)
#   total_seconds = total_mins * 60
#   Time.at(total_seconds).utc.strftime("%H:%M")
# end


# puts time_of_day(0)
# puts time_of_day(-3)
# puts time_of_day(35)
# puts time_of_day(-1437)
# puts time_of_day(3000)
# puts time_of_day(800)
# puts time_of_day(-4231)


# 3)
# def after_midnight(time)
#   time = time.chars
#   time.delete(":")

#   hours = time[0].concat(time[1]).to_i
#   mins = time[2].concat(time[3]).to_i
#   total_mins = hours * 60 + mins
#   total_mins = 0 if total_mins == 1440

#   total_mins
# end

# def before_midnight(time)
#   time = time.chars
#   time.delete(":")

#   hours = time[0].concat(time[1]).to_i
#   mins = time[2].concat(time[3]).to_i
#   total_mins = hours * 60 + mins

#   total_mins = 1440 if total_mins == 0

#   1440 - total_mins
# end

# puts after_midnight('00:00')
# puts before_midnight('00:00')
# puts after_midnight('12:34')
# puts before_midnight('12:34')
# puts after_midnight('24:00')
# puts before_midnight('24:00')


# 4)
# def swap(string)
#   string = string.split
#   string.map! do |word|
#     index_length = word.length - 1
#     first_char = word[0]
#     word[0] = word[index_length]
#     word[index_length] = first_char
#     word
#   end
#   string.join(' ')
# end

# p swap('Oh what a wonderful day it is')
# p swap('Abcde')
# p swap('a')


# 5)
# def cleanup(string)
#   string.gsub!(/[^a-zA-Z]/, ' ').squeeze(' ')
# end

# puts cleanup("---what's my +*& line?")


# 6)
# def word_sizes(string)
#   hash = {}
#   string.split.each do |word|
#     if hash.include?(word.length)
#       hash[word.length] += 1
#     else
#       hash[word.length] = 1
#     end
#   end
#   hash
# end

# puts word_sizes('Four score and seven.')
# puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
# puts word_sizes("What's up doc?")
# puts word_sizes('')


# 7)
# def word_sizes(string)
#   hash = {}
#   string = string.gsub(/[^a-zA-Z" "]/, '')

#   string.split.each do |word|
#     if hash.include?(word.length)
#       hash[word.length] += 1
#     else
#       hash[word.length] = 1
#     end
#   end
#   hash
# end

# puts word_sizes('Four score and seven.')
# puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
# puts word_sizes("What's up doc?")
# puts word_sizes('')


# 8)
# NUMBER_STRINGS = { 0=>'zero', 1=>'one', 2=>'two', 3=>'three', 4=>'four',
#   5=>'five', 6=>'six', 7=>'seven', 8=>'eight', 9=>'nine', 10=>'ten',
#   11=>'eleven', 12=>'twelve', 13=>'thirteen', 14=>'fourteen', 15=>'fifteen', 
#   16=>'sixteen', 17=>'seventeen', 18=>'eighteen', 19=>'nineteen' }

# def alphabetic_number_sort(array)
#   array.map! { |num| num = NUMBER_STRINGS[num] }
#   array.sort.map! { |string| string = NUMBER_STRINGS.key(string) }
# end

# p alphabetic_number_sort((0..19).to_a)


# 9)
# def crunch(string)
#   string = string.split

#   new_string = string.each do |word|
#     counter = 0
#     until counter == word.length
#       word[counter] = ' ' if word[counter + 1] == word[counter]
#       counter += 1
#     end
#     word.gsub!(' ', '')
#   end
#   new_string.join(' ')
# end

# p crunch('ddaaiillyy ddoouubbllee')
# p crunch('4444abcabccba')
# p crunch('ggggggggggggggg')
# p crunch('a')
# p crunch('')


# 10)
# def print_in_box(string)
#   top_bottom_box = "+" + "-" * (string.length + 2) + "+"
#   empty_line = "|" + " " * (string.length + 2) + "|"

#   puts top_bottom_box
#   puts empty_line
#   puts "| #{string} |"
#   puts empty_line
#   puts top_bottom_box
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# 11)
# Different object. Reverse mutates the objects in the array, not the original
# object. Nothing else is mutating so the result is different than the original
