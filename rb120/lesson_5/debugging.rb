# # RB120 exercises - debugging

# # 1)
# class Library
#   attr_accessor :address, :phone, :books

#   def initialize(address, phone)
#     @address = address
#     @phone = phone
#     @books = []
#   end

#   def check_in(book)
#     books.push(book)
#   end

#   def display_books
#     books.each do |book|
#       book.display_data
#     end
#   end
# end

# class Book
#   attr_accessor :title, :author, :isbn

#   def initialize(title, author, isbn)
#     @title = title
#     @author = author
#     @isbn = isbn
#   end

#   def display_data
#     puts "---------------"
#     puts "Title: #{title}"
#     puts "Author: #{author}"
#     puts "ISBN: #{isbn}"
#     puts "---------------"
#   end
# end

# community_library = Library.new('123 Main St.', '555-232-5652')
# learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
# little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
# wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

# community_library.check_in(learn_to_program)
# community_library.check_in(little_women)
# community_library.check_in(wrinkle_in_time)

# community_library.display_books # ---> added display_books method so library
# # can access the data in each book in its books array.


# # 2)
# require 'pry'
# class Animal
#   def initialize(diet, superpower)
#     @diet = diet
#     @superpower = superpower
#   end

#   def move
#     puts "I'm moving!"
#   end

#   def superpower
#     puts "I can #{@superpower}!"
#   end
# end

# class Fish < Animal
#   def move
#     puts "I'm swimming!"
#   end
# end

# class Bird < Animal
# end

# class FlightlessBird < Bird
#   def move
#     puts "I'm running!"
#   end
# end

# class SongBird < Bird
#   def initialize(diet, superpower, song)
#     super(diet, superpower)
#     @song = song
#   end

#   def move
#     puts "I'm flying!"
#   end
# end

# # Examples

# p unicornfish = Fish.new(:herbivore, 'breathe underwater')
# p penguin = FlightlessBird.new(:carnivore, 'drink sea water')
# p robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# # FlightlessBird#initialize method is unnecessary since it inherits the
# # initialize method from Bird and then Animal.


# # 3)
# class Person
#   attr_reader :name
#   attr_accessor :location

#   def initialize(name)
#     @name = name
#   end

#   def teleport_to(latitude, longitude)
#     @location = GeoLocation.new(latitude, longitude)
#   end
# end

# class GeoLocation
#   attr_reader :latitude, :longitude

#   def initialize(latitude, longitude)
#     @latitude = latitude
#     @longitude = longitude
#   end

#   def ==(other)
#     latitude == other.latitude && longitude == other.longitude
#   end

#   def to_s
#     "(#{latitude}, #{longitude})"
#   end
# end

# # Example

# ada = Person.new('Ada')
# ada.location = GeoLocation.new(53.477, -2.236)

# grace = Person.new('Grace')
# grace.location = GeoLocation.new(-33.89, 151.277)

# ada.teleport_to(-33.89, 151.277)

# puts ada.location                   # (-33.89, 151.277)
# puts grace.location                 # (-33.89, 151.277)
# puts ada.location == grace.location # returns true now that we redefined the
# # ==() method


# # 4)
# class EmployeeManagementSystem
#   attr_reader :employer

#   def initialize(employer)
#     @employer = employer
#     @employees = []
#   end

#   def add(employee)
#     if exists?(employee)
#       puts "Employee serial number is already in the system."
#     else
#       employees.push(employee)
#       puts "Employee added."
#     end
#   end

#   alias_method :<<, :add

#   def remove(employee)
#     if !exists?(employee)
#       puts "Employee serial number is not in the system."
#     else
#       employees.delete(employee)
#       puts "Employee deleted."
#     end
#   end

#   def exists?(employee)
#     employees.any? { |e| e == employee }
#   end

#   def display_all_employees
#     puts "#{employer} Employees: "

#     employees.each do |employee|
#       puts ""
#       puts employee.to_s
#     end
#   end

#   private

#   attr_accessor :employees
# end

# class Employee
#   attr_reader :name

#   def initialize(name, serial_number)
#     @name = name
#     @serial_number = serial_number
#   end

#   def ==(other)
#     serial_number == other.serial_number
#   end

#   def to_s
#     "Name: #{name}\n" +
#     "Serial No: #{abbreviated_serial_number}"
#   end

#   protected # changed to protected so instances of the calss can access

#   attr_reader :serial_number

#   def abbreviated_serial_number
#     serial_number[-4..-1]
#   end
# end

# # Example

# miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

# becca = Employee.new('Becca', '232-4437-1932')
# raul = Employee.new('Raul', '399-1007-4242')
# natasha = Employee.new('Natasha', '399-1007-4242')

# miller_contracting << becca     # => Employee added.
# miller_contracting << raul      # => Employee added.
# miller_contracting << raul      # => Employee serial number is already in the system.
# miller_contracting << natasha   # => Employee serial number is already in the system.
# miller_contracting.remove(raul) # => Employee deleted.
# miller_contracting.add(natasha) # => Employee added.

# miller_contracting.display_all_employees


# 5)
class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post


# 6)



# 7)



# 8)



# 9)



# 10)

