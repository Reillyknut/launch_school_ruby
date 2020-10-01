=begin

Questions:
1. What is a substring?
2. Will inputs always be strings?
3. Should substrings be removed from string?
4. Can there be multiple strings?

input: String
output: array of substrings that are palindromes
rules:
      Explicit requirements:
      - Palindromes are case sensitive
      - return only substrings which are palindromes

      Implicit requirements:
      - if string is empty or no palindromes exist, result will be empty array

Algorithm
- initialize result variable to empty array
- create substring array containing all substrings of the input > 2 characters long
- loop through all substrings in substring array
- check if substring is the same forward and backward (case sensitive)
  - if so, append substring to result array
- return result array



- create an empty array called `result` that will contain all required substrings
- create a `starting_index` variable (value `0`) for the starting index of a substring
- start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
  - create a `num_chars` variable (value `2`) for the length of a substring
  - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
    - extract a substring of length `num_chars` from `string` starting at `starting_index`
    - append the extracted substring to the `result` array
    - increment the `num_chars` variable by `1`
  - end the inner loop
  - increment the `starting_index` variable by `1`
- end the outer loop
- return the `result` array




def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); ["ili"]
p palindrome_substrings("abcddcbA");   ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); []
p palindrome_substrings("");           []
