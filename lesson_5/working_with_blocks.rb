# Example 3)
# Line    Action                Object          Side Effect       Return Value            Is Return Value Used?
# 1      .map method call       Outer array     none              new array [1, 3]        No
# 1-4     execute block         Nested array    none              array[0][0]             Yes, used my map
                                              
# 2      .first method call     each Nested     none              array[0][0]             Yes, used by puts
#                               array
# 2      .puts method call      array[0][0]     prints string of  nil                     No
#                                               Object
# 3      .first method call     each n array    none              array[0][0]             Yes, blocks return value


# Example 4)
# Line    Action                Object          Side Effect       Return Value            Is Return Value Used?
# 1       .each method call     outer array     assignment to     original array          No but assigned to my_arr
#                                               my_arr
# 1-7     execute block         nested array    none              nested array            No
# 2       .each method call     nested arrays   none              each orig nested array  Yes, as outer block return value
# 2-6     execute block         num in n arrs   none              nil???                  No
# 3       if conditional        num in n arrs   none              boolean true or false   Yes, by next if block
# 3-5     execute cond. block   boolean value   none              nil                     Yes, by puts
# 4       .puts method call     each int in     outputs num       nil                     Yes, as inner block return value
#                               inner array


# Example 5)
# Line    Action                Object          Side Effect       Return Value            Is Return Value Used?
# 1       .map method call      outer array     none              new arr [[2,4],[6,8]]   No
# 1-5     execute block         each n array    none              each mapped n array     Yes, by outer map
# 2       .map method call      each n array    none              new arr [2,4] & [6,8]   Yes, outer blocks return value
# 2-4     execute block         num in n arrays none              num * 2                 Yes, by inner map
# 3       * method call(2)      num in n arrays none              num * 2                 Yes, inner blocks return value


# Example 6)
# Line
# 1     .select method is called on outer array. It will return a new array with truthy values based on the block.
# 1-5   block executed on each hash inside the array. Returns all true values determined by .all? method. Used by select.
# 2     .all? method called on each hash. Returns boolean based on inner criteria. Used by outer block.
# 2-4   block executed on all k/v pairs in each hash. Returns boolean. Used by .all? method.
# 3     evaluation of all k/v pairs in each hash. Returns boolean. Used by inner block.

#swapping all? with any? would return the original array, since any k/v pairs that meet the criteria evaluate to true.


# Example 10)
# Line
# 1     .map method called on outer array. Returns new array based on return values of inner blocks => [[[2, 3], [4, 5]], [6, 7]]
# 1-11  block executed on each inner array. Returns modified inner arrays.
# 2     .map method called on inner array. Returns new array based on return values of inner inner blocks
# 2-10  block executed on each inner element. Returns modified inner elements.
# 3     .to_s.size method and comparison called on each element. Returns boolean.
# 3-9   conditional block (if) on elements. Returns nil?
# 4     + method called on inner element of non-double-nested array. Returns el + 1
# 6     .map method called on element inside inner inner array. Returns new array based on return value of + method
# 6-8   block executed on each inner inner element. Returns modified inner inner elements.
# 7     + method called on inner inner element of double-nested array. Returns n + 1 
