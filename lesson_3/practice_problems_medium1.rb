=begin

1)
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

two-liner: 
phrase = "The Flintstones Rock!"
10.times { puts phrase.prepend(' ') }

2)
Error because a string can't be added to an integer. Code should be:
puts "the value of 40 + 2 is #{40 + 2}"
or
puts "the value of 40 + 2 is " + (40 + 2).to_s

3)
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

bonus 1. "number % divisor == 0" checks if there is a remainder. If no remainder, the number is a factor
bonus 2. Line 8 makes sure factors is returned by the method and not just "nil"

4)
Yes the first method mutates buffer and doesn't change its object id. If this method is run again,
buffer will have been modified from the first method call.

The second method reassigns buffer, creating a new object id.
They both have the same return value but behind the scenes they refer to different objects.

5)
limit is not available in the scope of fib(). There are a few options one could use instead:

def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

or

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

6)
new_answer = 50, but the output of "p answer - 8" will be: 34

7)
Yes the data is all messed up now. Updating the hash values is not changing each hash itself and
instead is changing the values in it. The object id of each hash item stays the same but not what
is inside them.

8)
"paper"

9)
"no"

end