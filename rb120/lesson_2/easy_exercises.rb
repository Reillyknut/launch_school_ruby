# # 1)
# class Banner
#   def initialize(message)
#     @message = message
#     loop do
#       puts "Choose box length (or enter 0 for default): "
#       @length = gets.chomp.to_i
#       if @length == 0
#         @length = message.length
#         break
#       end
#       break unless @length < message.length
#       puts "Too small. Try again."
#     end
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+-#{'-' * @length}-+"
#   end

#   def empty_line
#     "| #{' ' * @length} |"
#   end

#   def message_line
#     "| #{@message.center(@length)} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner


# # 2)
# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name


# 3)
# class Book
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def title
#     @title
#   end

#   def author # can also use attr_reader for author and title
#     @author
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)


# # 4)
# class Book
#   attr_accessor :title, :author

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)


# # 5)
# class Person
#   attr_writer :first_name, :last_name

#   def initialize(first_name, last_name)
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def to_s
#     "#{@first_name.capitalize} #{@last_name.capitalize}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person


# 6)
# class Flight
#   attr_accessor :database_handle # delete this as there currently is no use for it.

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end


# # 7)
# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total # better than using @mileage since @mileage bypasses setter method entirely
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage


# 8)
# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(height, width = height)
#     super # super(height, height) also works, with initialize(height) above.
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"


# # 9)
# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cat #{@name} is #{@age} years old and has #{@color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch


# # 10)
# class Vehicle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Car < Vehicle
#   def wheels
#     4
#   end
# end

# class Motorcycle < Vehicle
#   def wheels
#     2
#   end
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(payload)
#     super(make, model)
#     @payload = payload
#   end

#   def wheels
#     6
#   end
# end

#-----------------------------------------------------------------------------#

# # 11)
# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address


# # 12)
# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive


# # 13)
# class House
#   attr_reader :price
#   include Comparable

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1


# # 14)
# class Transform
#   def initialize(string)
#     @string = string
#   end

#   def uppercase
#     @string.upcase
#   end

#   def self.lowercase(string)
#     string.downcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')


# # 15)
# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata # => ByeBye
# puts thing.dupdata # => HelloHello


# # 16)
# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end

#   protected

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end


# # 17)
# class Pet
#   attr_reader :animal, :name

#   def initialize(animal, name)
#     @animal = animal
#     @name = name
#   end

#   def to_s
#     "a #{animal} named #{name}"
#   end
# end

# class Owner
#   attr_reader :name, :owned_pets

#   def initialize(name)
#     @name = name
#     @owned_pets = []
#   end

#   def add_pet(pet)
#     @owned_pets << pet
#   end

#   def number_of_pets
#     @owned_pets.length
#   end

#   def print_pets
#     puts owned_pets
#   end
# end

# class Shelter
#   attr_reader :owners
#   def initialize
#     @owners = []
#   end

#   def adopt(owner, pet)
#     owner.add_pet(pet)
#     @owners << owner unless @owners.include?(owner)
#   end

#   def print_adoptions
#     @owners.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"
#       owner.print_pets
#       puts
#     end
#   end
# end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


# # 18) - nothing wrong with this - can call private methods with self as the caller now.
# class Expander
#   def initialize(string)
#     @string = string
#   end

#   def to_s
#     self.expand(3)
#   end

#   private

#   def expand(n)
#     @string * n
#   end
# end

# expander = Expander.new('xyz')
# puts expander


# # 19)
# module Walkable
#   def walk
#     "#{name} #{gait} forward."
#   end
# end

# class Person
#   attr_reader :name

#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   attr_reader :name

#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   attr_reader :name

#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# mike = Person.new("Mike")
# mike.walk

# kitty = Cat.new("Kitty")
# kitty.walk

# flash = Cheetah.new("Flash")
# flash.walk


# # 20)
# module Walkable
#   def walk
#     "#{name} #{gait} forward."
#   end
# end

# class Noble
#   attr_reader :name, :title
#   include Walkable

#   def initialize(name, title)
#     @name = "#{title} #{name}"
#   end

#   private
  
#   def gait
#     "struts"
#   end
# end

# byron = Noble.new("Byron", "Lord")
# p byron.walk