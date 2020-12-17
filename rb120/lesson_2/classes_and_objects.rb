# # 1)
# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end


# # 2)
# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(n)
#     @first_name = n
#     @last_name = ''
#   end

#   def name
#     @first_name + ' ' + @last_name
#   end
# end


# # 3)
# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(n)
#     @first_name = n
#     @last_name = ''
#   end

#   def name
#     @first_name + ' ' + @last_name
#   end

#   def name=(full_name)
#     @first_name = full_name.split.first
#     @last_name = full_name.split.last
#   end
# end


# # 4)
# bob.name == rob.name


# # 5)
# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(n)
#     @first_name = n
#     @last_name = ''
#   end

#   def name
#     @first_name + ' ' + @last_name
#   end

#   def name=(full_name)
#     @first_name = full_name.split.first
#     @last_name = full_name.split.last
#   end

#   def to_s
#     name
#   end
# end


