=begin

1)
a_outer_id will be the same before and inside the block and will be the same as d_outer_id
b_outer_id will be the same before and inside the block
c_outer_id will be the same before and inside the block
d_outer_id will be the same before and inside the block and will be the same as a_outer_id

after reassignment:
a_outer_id will change 
b_outer_id will change
c_outer_id will change
d_outer_id will change

a_inner_id will be the same as the corresponding outer_id
b_inner_id will be the same as the corresponding outer_id
c_inner_id will be the same as the corresponding outer_id
d_inner_id will be the same as the corresponding outer_id

a_outer will be 22 and will have the id of its reassignment inside the block
b_outer will be "thirty three" and will have the id of its reassignment inside the block
c_outer will be [44] and will have the id of its reassignment inside the block
d_outer will be 44 and will have the id of its reassignment inside the block

the inners and inner_ids will throw an exception because they haven't been initialized in the
outside scope and will print the rescue "ugh ohhhhh"


2)
an_illustrative_method will output the exact same as in problem 1, but fun_with_ids will have no
changes in their variables or in their ids since the inner ids are just values that are passed 
on. "ugh ohhhhh" will be returned at the end again, since fun_with_ids has no access to those
variables in an_illustrative_method.


3)
string will return "pumpkins"
array will be updated and return ["pumpkins", "rutabaga"]

in the method, the string was reassigned which didn't change the outside my_string variable. The
array was mutated inside the method and changed the outside my_array variable (but kept its 
object the same)

4)
This will do the opposite of the previous question. The string will return "pumpkinsrutabaga".
The array will return ["pumpkins"].


5)
Use comments or some other way to be more clear. The method could have a return statement at
the end so that it always returns the changes made in the method.


6)
def color_valid(color)
  color == "blue" || color == "green"
end


=end
