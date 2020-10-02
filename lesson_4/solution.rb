
def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  row_length = 1
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

##### TEST CASES #####

p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4, 6]
# start: 8, length: 3 --> [8, 10, 12]

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]

# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68

# --------------------------------------

# 1. Create an empty 'row' array to contain the integers
# 2. Add the starting integers
# 3. Increment starting integer by 2 to get next integer in the sequence
# 4. Repeat steps 2 and 3 until array has reached correct length
# 5. Return the 'row' array

# Start the loop
#   - Add the start integer to the row
#   - Increment the start integer by 2
#   - Break out of the loop if length of row = row_length

# Calculating the start integer:
# Rule: First integer of row == last integer of preceding row + 2
# Algorithm
# - Get the last row of the rows array
# - Get last integer of that row
# - add 2 to the integer








