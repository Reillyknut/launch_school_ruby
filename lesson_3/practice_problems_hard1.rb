=begin

1)
greeting returns nil


2)
informal_greeting points to the same value as greetings[:a]. Once informal_greeting
is mutated, greetings[:a] will be updated as well.
greetings now returns {:a=>"hi there"}


3)
a) one is set to "two", then two is set to "three", then three is set to "two". "two"
is returned from the method as it was the last thing performed. This method reassigns
so none of the original variables are mutated and print their original values when puts
is used.
b)
Method returns "one". Original variables are unchanged when puts is used.
c)
Method mutates original variables. Will return "one" when called.
one = "two"
two = "three"
three = "one"


4)
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end


=end
